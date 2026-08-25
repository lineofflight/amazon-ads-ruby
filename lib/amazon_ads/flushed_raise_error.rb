# frozen_string_literal: true
# rbs_inline: enabled

require "http"

module AmazonAds
  # Drop-in replacement for the http gem's raise_error feature that reads
  # the response body before raising. HTTP::Client#perform closes the
  # connection when a feature raises, so with the stock feature the body of
  # an error response is lost by the time callers rescue HTTP::StatusError.
  class FlushedRaiseError < HTTP::Feature
    # Status codes to pass through without raising
    attr_reader :ignore #: Array[Integer]

    #: (?ignore: Array[Integer]) -> void
    def initialize(ignore: [])
      super()
      @ignore = ignore
    end

    #: (HTTP::Response) -> HTTP::Response
    def wrap_response(response)
      return response if response.code < 400
      return response if ignore.include?(response.code)

      response.flush # memoize the body before Client#perform closes the connection
      raise HTTP::StatusError, response
    end

    HTTP::Options.register_feature(:flushed_raise_error, self)
  end
end
