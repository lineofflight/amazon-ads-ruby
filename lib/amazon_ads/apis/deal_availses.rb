# frozen_string_literal: true

module AmazonAds
  class DealAvailses < API
    # Query deal avails by advertising deal ID. Returns avails records aggregated by selected attributes over the last 7 days, sorted by eligible avails descending.
    #: (ad_product_filter: untyped, advertising_deal_id_filter: untyped, ?eligible_avails_targeting_filter: untyped?, ?group_by_attributes_filter: untyped?, ?max_results: Integer?, ?next_token: String?, ?sort: Array[untyped]?) -> HTTP::Response
    def query_deal_avails(ad_product_filter:, advertising_deal_id_filter:, eligible_avails_targeting_filter: nil, group_by_attributes_filter: nil, max_results: nil, next_token: nil, sort: nil)
      request(:post, "/adsApi/v1/query/dealAvailses", json: { "adProductFilter" => ad_product_filter, "advertisingDealIdFilter" => advertising_deal_id_filter, "eligibleAvailsTargetingFilter" => eligible_avails_targeting_filter, "groupByAttributesFilter" => group_by_attributes_filter, "maxResults" => max_results, "nextToken" => next_token, "sort" => sort }.compact)
    end
  end
end
