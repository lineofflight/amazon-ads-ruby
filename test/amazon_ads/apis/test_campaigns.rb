# frozen_string_literal: true

require "test_helper"

class TestCampaigns < Minitest::Test
  include FeatureHelpers

  def test_query_campaign
    res = @api.query_campaign(
      ad_product_filter: { "include" => ["SPONSORED_PRODUCTS"] },
    )

    assert_predicate(res.status, :success?)
  end
end
