# frozen_string_literal: true

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("api" => "API", "lwa" => "LWA")
loader.collapse("#{__dir__}/amazon_ads/apis")
loader.ignore("#{__dir__}/generator")
loader.ignore("#{__dir__}/amazon_ads/flushed_raise_error.rb")
loader.setup
require_relative "amazon_ads/flushed_raise_error"

# Amazon Ads API client for Ruby
module AmazonAds
  class << self
    # Sets the client ID
    attr_writer :client_id #: String?

    # Sets the client secret
    attr_writer :client_secret #: String?
  end

  # Returns the client ID
  # Falls back to the `AMAZON_ADS_CLIENT_ID` env var
  #: () -> String?
  def self.client_id
    @client_id || ENV["AMAZON_ADS_CLIENT_ID"]
  end

  # Returns the client ID or raises
  #: () -> String
  def self.client_id!
    client_id or raise ArgumentError, "client id is required"
  end

  # Returns the client secret
  # Falls back to the `AMAZON_ADS_CLIENT_SECRET` env var
  #: () -> String?
  def self.client_secret
    @client_secret || ENV["AMAZON_ADS_CLIENT_SECRET"]
  end

  # Returns the client secret or raises
  #: () -> String
  def self.client_secret!
    client_secret or raise ArgumentError, "client secret is required"
  end
end
