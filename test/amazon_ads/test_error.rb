# frozen_string_literal: true

require "test_helper"

class TestError < Minitest::Test
  def setup
    @response = build_response('{"message":"Invalid filter"}')
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

  def test_build_returns_subclass_for_known_code
    response = build_response('{"code":"NOT_FOUND","message":"No such campaign"}', status: 404)
    error = AmazonAds::Error.build(response)

    assert_instance_of(AmazonAds::Errors::NotFound, error)
    assert_equal("NOT_FOUND", error.code)
    assert_equal(response, error.response)
  end

  def test_build_falls_back_for_unknown_code
    error = AmazonAds::Error.build(build_response('{"code":"SOMETHING_NEW","message":"Surprise"}'))

    assert_instance_of(AmazonAds::Error, error)
    assert_equal("SOMETHING_NEW", error.code)
  end

  def test_build_falls_back_for_reporting_envelope
    error = AmazonAds::Error.build(build_response('{"code":"400","detail":"Invalid report"}'))

    assert_instance_of(AmazonAds::Error, error)
    assert_equal("400", error.code)
  end

  def test_build_falls_back_without_code
    error = AmazonAds::Error.build(@response)

    assert_nil(error.code)
  end

  def test_build_falls_back_for_non_json_body
    error = AmazonAds::Error.build(build_response("<html>Bad Gateway</html>", status: 502))

    assert_instance_of(AmazonAds::Error, error)
    assert_nil(error.code)
  end

  def test_build_falls_back_for_non_object_body
    error = AmazonAds::Error.build(build_response('["NOT_FOUND"]'))

    assert_instance_of(AmazonAds::Error, error)
    assert_nil(error.code)
  end

  def test_build_falls_back_for_non_string_code
    error = AmazonAds::Error.build(build_response('{"code":404}'))

    assert_instance_of(AmazonAds::Error, error)
    assert_nil(error.code)
  end

  def test_pattern_matching_on_code
    error = AmazonAds::Error.build(build_response('{"code":"TOO_MANY_REQUESTS","message":"Slow down"}', status: 429))

    matched = case error
    in code: "TOO_MANY_REQUESTS" then true
    else false
    end

    assert(matched)
  end

  private

  def build_response(body, status: 400)
    HTTP::Response.new(
      status: status,
      version: "1.1",
      body: body,
      request: HTTP::Request.new(verb: :post, uri: "https://advertising-api.amazon.com/test"),
    )
  end
end
