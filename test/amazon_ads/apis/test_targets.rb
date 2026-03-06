# frozen_string_literal: true

require "test_helper"

class TestTargets < Minitest::Test
  include FeatureHelpers

  def test_query_target
    res = @api.query_target(
      ad_product_filter: { "include" => ["SPONSORED_PRODUCTS"] },
    )

    assert_predicate(res.status, :success?)
  end
end
