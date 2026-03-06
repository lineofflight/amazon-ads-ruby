# frozen_string_literal: true

require "test_helper"

class TestLWA < Minitest::Test
  include Recordable

  def test_request_returns_parsed_response
    data = AmazonAds::LWA.request(
      refresh_token: ENV.fetch("AMAZON_ADS_TEST_REFRESH_TOKEN"),
    )

    assert(data.key?("access_token"))
    assert(data.key?("expires_in"))
  end
end
