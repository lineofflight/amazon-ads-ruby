# frozen_string_literal: true

require "test_helper"

class TestAdGroups < Minitest::Test
  include FeatureHelpers

  def test_query_ad_group
    res = @api.query_ad_group(
      ad_product_filter: { "include" => ["SPONSORED_PRODUCTS"] },
    )

    assert_predicate(res.status, :success?)
  end
end
