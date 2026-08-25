# frozen_string_literal: true

require "test_helper"

class TestReporting < Minitest::Test
  include FeatureHelpers

  def test_create_async_report
    res = @api.create_async_report(
      configuration: {
        "adProduct" => "SPONSORED_PRODUCTS",
        "reportTypeId" => "spCampaigns",
        "columns" => ["campaignId", "campaignName", "impressions", "clicks", "cost"],
        "groupBy" => ["campaign"],
        "timeUnit" => "DAILY",
        "format" => "GZIP_JSON",
      },
      start_date: "2026-08-01",
      end_date: "2026-08-02",
      name: "SP Campaign Report",
    )

    assert_predicate(res.status, :success?)
    assert(res.parse.key?("reportId"))
  end

  def test_get_async_report
    res = @api.get_async_report("98cb7c6b-e560-489c-bf08-86e16fadbdcb")

    assert_predicate(res.status, :success?)
  end

  def test_delete_async_report
    res = @api.delete_async_report("98cb7c6b-e560-489c-bf08-86e16fadbdcb")

    assert_predicate(res.status, :success?)
  end
end
