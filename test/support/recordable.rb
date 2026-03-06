# frozen_string_literal: true

require "vcr"
require "webmock/minitest"

VCR.configure do |c|
  c.hook_into(:webmock)
  c.cassette_library_dir = "test/vcr_cassettes"

  # Filter credentials from LWA request bodies
  ["client_id", "client_secret", "refresh_token"].each do |param|
    c.filter_sensitive_data("FILTERED") do |interaction|
      interaction.request.body.to_s[/(?<=#{param}=)[^&]+/]
    end
  end

  # Filter tokens from LWA response bodies
  ["refresh_token", "access_token"].each do |token|
    c.filter_sensitive_data("FILTERED") do |interaction|
      JSON.parse(interaction.response.body)[token]
    rescue
      nil
    end
  end

  # Filter auth headers (webmock normalizes header keys)
  [
    "Authorization",
    "Amazon-Advertising-Api-Clientid",
    "Amazon-Advertising-Api-Scope",
    "Amazon-Ads-Accountid",
  ].each do |header|
    c.filter_sensitive_data("FILTERED") do |interaction|
      interaction.request.headers[header]&.first
    end
  end

  c.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: [:method, :uri],
  }

  c.preserve_exact_body_bytes do |http_message|
    http_message.body.encoding.name == "ASCII-8BIT" ||
      !http_message.body.valid_encoding?
  end
end

module Recordable
  def setup
    super

    test_name = "#{self.class.name}/#{name}".gsub("::", "/")
    VCR.insert_cassette(test_name)
  end

  def teardown
    super

    VCR.eject_cassette
  end
end
