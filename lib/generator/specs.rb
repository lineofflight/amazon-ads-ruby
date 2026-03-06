# frozen_string_literal: true

require "http"
require "yaml"
require "json"
require "fileutils"

module Generator
  # Downloads and caches OpenAPI specs from Amazon Ads
  module Specs
    SPECS = {
      amazon_ads: "https://d1y2lf8k3vrkfu.cloudfront.net/openapi/en-us/dest/AmazonAdsAPIALLMerged_prod_3p.json",
      profiles: "https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/profiles/3-0/openapi.yaml",
      reporting: "https://d1y2lf8k3vrkfu.cloudfront.net/openapi/en-us/dest/OfflineReport_prod_3p.json",
      marketing_stream: "https://dtrnk0o2zy01c.cloudfront.net/openapi/en-us/dest/AmazonMarketingStream_prod_3p.json",
    }.freeze

    SPECS_DIR = File.expand_path("../../specs", __dir__)

    class << self
      def download_all
        FileUtils.mkdir_p(SPECS_DIR)

        SPECS.each do |name, url|
          download(name, url)
        end
      end

      def download(name, url)
        ext = File.extname(URI.parse(url).path)
        puts "Downloading #{name}..."
        response = HTTP.get(url)

        unless response.status.success?
          warn("Failed to download #{name}: #{response.status}")
          return
        end

        path = File.join(SPECS_DIR, "#{name}#{ext}")
        File.write(path, response.body.to_s)
        puts "Saved #{path}"
      end

      def load(name)
        yaml_path = File.join(SPECS_DIR, "#{name}.yaml")
        json_path = File.join(SPECS_DIR, "#{name}.json")

        if File.exist?(yaml_path)
          YAML.load_file(yaml_path)
        elsif File.exist?(json_path)
          JSON.parse(File.read(json_path))
        else
          raise "Spec not found: #{name}"
        end
      end
    end
  end
end
