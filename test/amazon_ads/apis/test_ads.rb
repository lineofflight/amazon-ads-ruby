# frozen_string_literal: true

require "test_helper"

class TestAds < Minitest::Test
  include FeatureHelpers

  def test_query_ad
    res = @api.query_ad(
      ad_product_filter: { "include" => ["SPONSORED_PRODUCTS"] },
    )

    assert_predicate(res.status, :success?)
  end
end
