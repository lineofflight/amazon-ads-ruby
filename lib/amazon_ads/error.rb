# frozen_string_literal: true

require "http"
require "json"

module AmazonAds
  # Raised when the API or LWA responds with a 4xx or 5xx
  class Error < StandardError
    # The failed response
    attr_reader :response #: HTTP::Response?

    # Amazon's error code, if the response carries one
    attr_reader :code #: String?

    # Returns the subclass in Errors matching the response's error code,
    # falling back to Error when the code is unknown or missing
    #
    #: (HTTP::Response) -> Error
    def self.build(response)
      response.flush # memoize the body while the connection is still readable
      code = parse_code(response)
      klass = (code && Errors::CODES[code]) || Error
      klass.new(response.status.to_s, response, code: code)
    end

    #: (HTTP::Response) -> String?
    def self.parse_code(response)
      body = JSON.parse(response.body.to_s)
      code = body["code"] if body.is_a?(Hash)
      code if code.is_a?(String)
    rescue JSON::ParserError
      nil
    end
    private_class_method :parse_code

    #: (?String?, ?HTTP::Response?, ?code: String?) -> void
    def initialize(msg = nil, response = nil, code: nil)
      @response = response
      @code = code
      super(msg)
    end

    #: () -> Integer?
    def status
      response&.status&.code
    end

    # Supports pattern matching on status and code
    #
    #   case error
    #   in code: "TOO_MANY_REQUESTS" then backoff
    #   in status: 500..599 then retry
    #   end
    #
    #: (Array[Symbol]?) -> Hash[Symbol, untyped]
    def deconstruct_keys(keys)
      hash = { status: status, code: code }
      keys ? hash.slice(*keys) : hash
    end
  end
end
