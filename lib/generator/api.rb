# frozen_string_literal: true

require "erb"
require "fileutils"

module Generator
  # Generates API classes from OpenAPI specs
  class API
    TEMPLATE_PATH = File.expand_path("templates/api.erb", __dir__)
    OUTPUT_DIR = File.expand_path("../../lib/amazon_ads/apis", __dir__)

    attr_reader :spec_name, :spec, :class_name, :file_name

    def initialize(spec_name, tag: nil, spec: nil)
      @spec_name = spec_name
      @spec = spec || Generator::Specs.load(spec_name)
      @tag = tag
      @class_name = tag || spec_name.split("_").map(&:capitalize).join
      @file_name = to_snake_case(tag || spec_name)
    end

    def generate
      template = File.read(TEMPLATE_PATH)
      ERB.new(template, trim_mode: "-").result(binding)
    end

    def save
      FileUtils.mkdir_p(OUTPUT_DIR)

      path = File.join(OUTPUT_DIR, "#{file_name}.rb")
      File.write(path, generate)
      puts("Generated #{path}")
    end

    class << self
      # Generate all classes for a multi-tag spec (v1 RPC-style)
      def generate_by_tags(spec_name)
        spec = Generator::Specs.load(spec_name)
        tags = extract_tags(spec)
        tags.each_key do |tag|
          api = new(spec_name, tag: tag, spec: spec)
          api.save
        end
      end

      # Returns tag names from a spec
      def extract_tags(spec)
        tags = {}
        spec["paths"].each do |_path, methods|
          methods.each do |_http_method, details|
            next unless details.is_a?(Hash) && details["operationId"]

            tag = (details["tags"] || ["Untagged"]).first
            tags[tag] = true
          end
        end
        tags
      end
    end

    private

    def operations
      ops = spec["paths"].flat_map do |path, methods|
        methods.filter_map do |http_method, details|
          next unless ["get", "post", "put", "patch", "delete"].include?(http_method)
          next unless details["operationId"]
          next if @tag && !details.fetch("tags", []).include?(@tag)

          build_operation(path, http_method, details)
        end
      end

      ops.sort_by { |op| op[:method_name] }
    end

    def build_operation(path, http_method, details)
      url_params = extract_params(details)
      path_params = url_params.select { |p| p[:in] == "path" }
      query_params = url_params.select { |p| p[:in] == "query" }
      has_body = ["post", "put", "patch"].include?(http_method) && details["requestBody"]
      body_params = has_body ? extract_body_params(details) : []
      raw_body = has_body && body_params.empty?
      content_type = has_body ? extract_content_type(details) : nil

      all_params = path_params + query_params + body_params

      {
        method_name: to_method_name(details["operationId"]),
        http_method: http_method,
        path: interpolate_path(path),
        summary: clean_description(details["summary"]),
        description: clean_description(details["description"]),
        param_docs: build_param_docs(all_params, raw_body: raw_body),
        params: build_params(all_params, raw_body: raw_body),
        signature: build_signature(all_params, raw_body: raw_body),
        args: build_args(query_params, body_params, raw_body: raw_body, content_type: content_type),
      }
    end

    def extract_params(details)
      (details["parameters"] || []).filter_map do |param|
        param = resolve_ref(param["$ref"]) if param["$ref"]
        next unless param&.dig("name")
        next if param["in"] == "header"

        {
          name: to_snake_case(param["name"]),
          original_name: param["name"],
          in: param["in"],
          required: param["required"] || false,
          type: param.dig("schema", "type") || "string",
          description: clean_description(param["description"]),
        }
      end
    end

    def extract_body_params(details)
      content = details.dig("requestBody", "content")
      return [] unless content

      schema = content.values.first&.dig("schema")
      return [] unless schema

      schema = resolve_ref(schema["$ref"]) if schema["$ref"]
      return [] unless schema&.dig("properties")

      required = schema["required"] || []

      schema["properties"].map do |name, prop|
        {
          name: to_snake_case(name),
          original_name: name,
          in: "body",
          required: required.include?(name),
          type: prop["type"] || (prop["$ref"] && "object") || "string",
          description: clean_description(prop["description"]),
        }
      end
    end

    def resolve_ref(ref)
      return unless ref

      parts = ref.delete_prefix("#/").split("/")
      parts.reduce(spec) { |obj, key| obj&.dig(key) }
    end

    def to_method_name(operation_id)
      to_snake_case(operation_id)
    end

    def to_snake_case(str)
      str.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .tr("-", "_")
        .downcase
    end

    def interpolate_path(path)
      path.gsub(/\{(\w+)\}/) { '#{' + to_snake_case(::Regexp.last_match(1)) + "}" }
    end

    def build_params(all_params, raw_body: false)
      path, keyword = all_params.partition { |p| p[:in] == "path" }
      required, optional = keyword.partition { |p| p[:required] }
      parts = []
      path.each { |p| parts << p[:name] }
      required.each { |p| parts << "#{p[:name]}:" }
      optional.each { |p| parts << "#{p[:name]}: nil" }
      parts << "json: {}" if raw_body
      parts.join(", ")
    end

    def build_signature(all_params, raw_body: false)
      path, keyword = all_params.partition { |p| p[:in] == "path" }
      required, optional = keyword.partition { |p| p[:required] }
      parts = []
      path.each { |p| parts << ruby_type(p[:type]) }
      required.each { |p| parts << "#{p[:name]}: #{ruby_type(p[:type])}" }
      optional.each { |p| parts << "?#{p[:name]}: #{ruby_type(p[:type])}?" }
      parts << "?json: untyped" if raw_body
      parts.join(", ")
    end

    def build_args(query_params, body_params, raw_body: false, content_type: nil)
      args = []
      if query_params.any?
        params_hash = query_params.map { |p| "\"#{p[:original_name]}\" => #{p[:name]}" }.join(", ")
        args << "params: { #{params_hash} }.compact"
      end
      if body_params.any?
        body_hash = body_params.map { |p| "\"#{p[:original_name]}\" => #{p[:name]}" }.join(", ")
        args << "json: { #{body_hash} }.compact"
      elsif raw_body
        args << "json: json"
      end
      if content_type && content_type != "application/json"
        args << "headers: { \"Content-Type\" => \"#{content_type}\" }"
      end
      args.empty? ? "" : ", #{args.join(", ")}"
    end

    def extract_content_type(details)
      content = details.dig("requestBody", "content")
      content&.keys&.first
    end

    def build_param_docs(all_params, raw_body: false)
      docs = all_params.filter_map do |p|
        next unless p[:description]

        "# @rbs #{p[:name]}: #{ruby_type(p[:type])} -- #{p[:description]}"
      end
      docs << "# @rbs json: untyped -- Request body" if raw_body && docs.any?
      docs
    end

    def clean_description(text)
      return unless text

      # Take the first paragraph (before any **Authorized resource type** or similar blocks)
      text = text.split("\n\n**").first || text
      text = text.gsub(/\s+/, " ").strip
      text.empty? ? nil : text
    end

    def ruby_type(openapi_type)
      case openapi_type
      when "integer" then "Integer"
      when "number" then "Numeric"
      when "boolean" then "bool"
      when "array" then "Array[untyped]"
      when "object" then "untyped"
      else "String"
      end
    end
  end
end
