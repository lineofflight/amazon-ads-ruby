# frozen_string_literal: true

require "http"

module AmazonAds
  # Raised when the API or LWA responds with a 4xx or 5xx
  class Error < StandardError
    # The failed response
    attr_reader :response #: HTTP::Response?

    #: (HTTP::Response) -> Error
    def self.build(response)
      response.flush # memoize the body while the connection is still readable
      new(response.status.to_s, response)
    end

    #: (?String?, ?HTTP::Response?) -> void
    def initialize(msg = nil, response = nil)
      @response = response
      super(msg)
    end

    #: () -> Integer?
    def status
      response&.status&.code
    end

    # Supports pattern matching on status
    #
    #   case error
    #   in status: 429 then backoff
    #   in status: 500..599 then retry
    #   end
    #
    #: (Array[Symbol]?) -> Hash[Symbol, untyped]
    def deconstruct_keys(keys)
      hash = { status: status }
      keys ? hash.slice(*keys) : hash
    end
  end
end
