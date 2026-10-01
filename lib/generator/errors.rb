# frozen_string_literal: true

require "erb"

module Generator
  # Generates error classes from the ErrorCode enum
  class Errors
    TEMPLATE_PATH = File.expand_path("templates/errors.erb", __dir__.to_s)
    OUTPUT_PATH = File.expand_path("../../lib/amazon_ads/errors.rb", __dir__.to_s)

    attr_reader :spec

    #: (?spec: untyped) -> void
    def initialize(spec: nil)
      @spec = spec || Generator::Specs.load("amazon_ads")
    end

    def generate
      template = File.read(TEMPLATE_PATH)
      ERB.new(template, trim_mode: "-").result(binding)
    end

    def save
      File.write(OUTPUT_PATH, generate)
      puts("Generated #{OUTPUT_PATH}")
    end

    private

    def errors
      schema = spec.dig("components", "schemas", "ErrorCode")
      descriptions = extract_descriptions(schema["description"])

      schema["enum"].map do |code|
        {
          code: code,
          class_name: code.split("_").map(&:capitalize).join,
          description: descriptions[code],
        }
      end
    end

    # Amazon documents each code in a markdown table inside the enum description
    def extract_descriptions(text)
      text.to_s.scan(/^\| `(\w+)` \| (.+?) \|$/).to_h
    end
  end
end
