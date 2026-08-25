# frozen_string_literal: true

require "test_helper"

class TestError < Minitest::Test
  def setup
    @response = HTTP::Response.new(
      status: 400,
      version: "1.1",
      body: '{"message":"Invalid filter"}',
      request: HTTP::Request.new(verb: :post, uri: "https://advertising-api.amazon.com/test"),
    )
  end

  def test_build_attaches_response
    error = AmazonAds::Error.build(@response)

    assert_instance_of(AmazonAds::Error, error)
    assert_equal(@response, error.response)
  end

  def test_status
    error = AmazonAds::Error.build(@response)

    assert_equal(400, error.status)
  end

  def test_message_includes_status
    error = AmazonAds::Error.build(@response)

    assert_match(/400/, error.message)
  end

  def test_pattern_matching_on_status
    error = AmazonAds::Error.build(@response)

    matched = case error
    in status: 400 then true
    else false
    end

    assert(matched)
  end
end
