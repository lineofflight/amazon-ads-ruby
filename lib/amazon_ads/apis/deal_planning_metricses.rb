# frozen_string_literal: true

module AmazonAds
  class DealPlanningMetricses < API
    # Query deal planning metrics for specified deals, with optional metric range filters and sort.
    #: (ad_product_filter: untyped, advertising_deal_id_filter: untyped, ?click_through_rate_filter: untyped?, ?currency_filter: untyped?, ?effective_cpm_filter: untyped?, ?max_results: Integer?, ?measured_rate_filter: untyped?, ?next_token: String?, ?sort: Array[untyped]?, ?video_completion_rate_filter: untyped?, ?view_rate_filter: untyped?, ?viewable_cpm_filter: untyped?) -> HTTP::Response
    def query_deal_planning_metrics(ad_product_filter:, advertising_deal_id_filter:, click_through_rate_filter: nil, currency_filter: nil, effective_cpm_filter: nil, max_results: nil, measured_rate_filter: nil, next_token: nil, sort: nil, video_completion_rate_filter: nil, view_rate_filter: nil, viewable_cpm_filter: nil)
      request(:post, "/adsApi/v1/query/dealPlanningMetricses", json: { "adProductFilter" => ad_product_filter, "advertisingDealIdFilter" => advertising_deal_id_filter, "clickThroughRateFilter" => click_through_rate_filter, "currencyFilter" => currency_filter, "effectiveCPMFilter" => effective_cpm_filter, "maxResults" => max_results, "measuredRateFilter" => measured_rate_filter, "nextToken" => next_token, "sort" => sort, "videoCompletionRateFilter" => video_completion_rate_filter, "viewRateFilter" => view_rate_filter, "viewableCPMFilter" => viewable_cpm_filter }.compact)
    end
  end
end
