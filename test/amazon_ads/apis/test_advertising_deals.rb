# frozen_string_literal: true

require "test_helper"

class TestAdvertisingDeals < Minitest::Test
  include FeatureHelpers

  def test_sb_query_advertising_deal
    res = @api.sb_query_advertising_deal

    assert_predicate(res.status, :success?)
  end
end
