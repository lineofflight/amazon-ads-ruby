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

  def test_query_campaign_rejects_bare_string_filter
    api = AmazonAds::Campaigns.new(
      region: "EU",
      profile_id: ENV.fetch("AMAZON_ADS_TEST_EU_PROFILE_ID", "0"),
      access_token:,
    )
    error = assert_raises(HTTP::StatusError) do
      api.query_campaign(ad_product_filter: "SPONSORED_PRODUCTS")
    end

    assert_equal(400, error.response.status.code)
    assert(error.response.body.to_s.length.positive?)
  end
end
