# frozen_string_literal: true
# rbs_inline: enabled

require "http"

module AmazonAds
  # Requests Login with Amazon (LWA) access tokens for the Amazon Ads API
  # Stateless: each call to #request hits the token endpoint; the caller
  # owns caching
  class LWA
    URL = "https://api.amazon.com/auth/o2/token" #: String

    # The OAuth refresh token
    attr_reader :refresh_token #: String

    class << self
      #: (**untyped) -> Hash[String, untyped]
      def request(...)
        new(...).request
      end
    end

    #: (refresh_token: String, ?http: untyped) -> void
    def initialize(refresh_token:, http: HTTP)
      @refresh_token = refresh_token
      @http = http
    end

    # Requests a fresh access token from LWA
    #: () -> Hash[String, untyped]
    def request
      http.post(URL, form: params).parse
    end

    private

    #: () -> HTTP::Client
    def http
      @http.use(:raise_error)
    end

    #: () -> Hash[Symbol, String]
    def params
      {
        grant_type: "refresh_token",
        client_id:,
        client_secret:,
        refresh_token:,
      }
    end

    #: () -> String
    def client_id
      AmazonAds.client_id!
    end

    #: () -> String
    def client_secret
      AmazonAds.client_secret!
    end
  end
end
