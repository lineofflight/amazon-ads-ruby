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
      start_date: "2026-01-01",
      end_date: "2026-01-02",
      name: "SP Campaign Report",
    )

    assert_predicate(res.status, :success?)
    assert(res.parse.key?("reportId"))
  end

  def test_get_async_report
    res = @api.get_async_report("4b47565f-1e46-456e-8a98-4264b3c85ec4")

    assert_predicate(res.status, :success?)
  end

  def test_delete_async_report
    res = @api.delete_async_report("4b47565f-1e46-456e-8a98-4264b3c85ec4")

    assert_predicate(res.status, :success?)
  end
end
