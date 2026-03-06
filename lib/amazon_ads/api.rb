# frozen_string_literal: true

# rbs_inline: enabled

require "http"

module AmazonAds
  # Base class for Amazon Ads API endpoints
  class API
    ENDPOINTS = { #: Hash[Symbol, String]
      na: "advertising-api.amazon.com",
      eu: "advertising-api-eu.amazon.com",
      fe: "advertising-api-fe.amazon.com",
    }.freeze

    # API endpoint region
    attr_reader :region #: Symbol

    # LWA access token
    attr_reader :access_token #: String

    # Advertiser profile, scopes requests to a marketplace
    attr_reader :profile_id #: String?

    # Advertiser account
    attr_reader :account_id #: String?

    # Number of retries when throttled (default: 0)
    attr_reader :retries #: Integer

    #: (region: Symbol | String, access_token: String, ?profile_id: String?, ?account_id: String?, ?retries: Integer, ?http: untyped) -> void
    def initialize(region:, access_token:, profile_id: nil, account_id: nil, retries: 0, http: HTTP)
      @region = region.to_s.downcase.to_sym
      @access_token = access_token
      @profile_id = profile_id
      @account_id = account_id
      @retries = retries
      @http = http
    end

    #: () -> URI::HTTPS
    def endpoint
      URI::HTTPS.build(host: ENDPOINTS.fetch(region) do
        raise ArgumentError, "Unknown region: #{region}"
      end)
    end

    #: () -> HTTP::Client
    def http
      client = @http
        .headers(default_headers)
        .use(:auto_inflate)

      if retries.zero?
        client.use(:raise_error)
      else
        client
          .use(raise_error: { ignore: [429] })
          .retriable(tries: retries + 1, retry_statuses: [429])
      end
    end

    private

    #: (Symbol, String, **untyped) -> HTTP::Response
    def request(method, path, **options)
      url = endpoint
      url.path = path
      http.request(method, url, **options)
    end

    #: () -> Hash[String, String]
    def default_headers
      headers = {
        "Authorization" => "Bearer #{access_token}",
        "Amazon-Advertising-API-ClientId" => client_id,
        "Content-Type" => "application/json",
        "Accept" => "application/json",
      }
      headers["Amazon-Advertising-API-Scope"] = profile_id if profile_id
      headers["Amazon-Ads-AccountId"] = account_id if account_id

      headers
    end

    #: () -> String
    def client_id
      AmazonAds.client_id!
    end
  end
end
