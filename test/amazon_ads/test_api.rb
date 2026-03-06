# frozen_string_literal: true

require "test_helper"

class TestAPI < Minitest::Test
  def test_normalizes_region
    assert_equal(:na, AmazonAds::API.new(region: "NA", access_token: "t").region)
  end
end
