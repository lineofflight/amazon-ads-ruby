# frozen_string_literal: true
# rbs_inline: enabled

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("api" => "API", "lwa" => "LWA")
loader.collapse("#{__dir__}/amazon_ads/apis")
loader.ignore("#{__dir__}/generator")
loader.setup

# Amazon Ads API client for Ruby
module AmazonAds
  class << self
    # Returns the client ID
    # Falls back to the `AMAZON_ADS_CLIENT_ID` env var
    #: () -> String?
    def client_id
      @client_id || ENV["AMAZON_ADS_CLIENT_ID"]
    end

    # Sets the client ID
    #: (String?) -> String?
    attr_writer :client_id

    # Returns the client ID or raises
    #: () -> String
    def client_id!
      client_id or raise ArgumentError, "client id is required"
    end

    # Returns the client secret
    # Falls back to the `AMAZON_ADS_CLIENT_SECRET` env var
    #: () -> String?
    def client_secret
      @client_secret || ENV["AMAZON_ADS_CLIENT_SECRET"]
    end

    # Sets the client secret
    #: (String?) -> String?
    attr_writer :client_secret

    # Returns the client secret or raises
    #: () -> String
    def client_secret!
      client_secret or raise ArgumentError, "client secret is required"
    end
  end
end
