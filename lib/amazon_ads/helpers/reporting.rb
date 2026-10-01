# frozen_string_literal: true

require "http"
require "stringio"
require "zlib"

module AmazonAds
  module Helpers
    # Convenience methods for the Reporting API
    module Reporting
      # Downloads a report by report ID or presigned download URL
      #
      # @param report_id_or_url [String] The report identifier or download URL
      # @return [HTTP::Response] The response containing decompressed report content
      #: (String) -> HTTP::Response
      def download_report(report_id_or_url)
        url = if report_id_or_url.start_with?("http")
          report_id_or_url
        else
          # @type var client: AmazonAds::Reporting
          client = self
          client.get_async_report(report_id_or_url).parse.fetch("url")
        end

        download_report_from_url(url)
      end

      private

      #: (String) -> HTTP::Response
      def download_report_from_url(url)
        response = HTTP.use(:auto_inflate).get(url)
        body = response.body.to_s
        if body.b.start_with?("\x1F\x8B".b)
          body = Zlib::GzipReader.new(StringIO.new(body)).read
        end

        headers = response.headers.to_h
        headers["Content-Type"] ||= "application/json"

        HTTP::Response.new(
          status: response.code,
          version: response.version,
          headers: headers,
          body: body,
          request: response.request,
        )
      end
    end
  end
end
