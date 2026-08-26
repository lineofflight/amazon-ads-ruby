# frozen_string_literal: true

module AmazonAds
  class Ads < API
    # Create ads
    #: (ads: Array[untyped]) -> HTTP::Response
    def create_ad(ads:)
      request(:post, "/adsApi/v1/create/ads", json: { "ads" => ads }.compact)
    end

    # Delete ads
    #: (ad_ids: Array[untyped]) -> HTTP::Response
    def delete_ad(ad_ids:)
      request(:post, "/adsApi/v1/delete/ads", json: { "adIds" => ad_ids }.compact)
    end

    # List ads
    #: (ad_product_filter: untyped, ?ad_group_id_filter: untyped?, ?ad_id_filter: untyped?, ?campaign_id_filter: untyped?, ?marketplace_scope_filter: untyped?, ?max_results: Integer?, ?name_filter: untyped?, ?next_token: String?, ?state_filter: untyped?) -> HTTP::Response
    def query_ad(ad_product_filter:, ad_group_id_filter: nil, ad_id_filter: nil, campaign_id_filter: nil, marketplace_scope_filter: nil, max_results: nil, name_filter: nil, next_token: nil, state_filter: nil)
      request(:post, "/adsApi/v1/query/ads", json: { "adGroupIdFilter" => ad_group_id_filter, "adIdFilter" => ad_id_filter, "adProductFilter" => ad_product_filter, "campaignIdFilter" => campaign_id_filter, "marketplaceScopeFilter" => marketplace_scope_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "stateFilter" => state_filter }.compact)
    end

    # Update ads
    #: (ads: Array[untyped]) -> HTTP::Response
    def update_ad(ads:)
      request(:post, "/adsApi/v1/update/ads", json: { "ads" => ads }.compact)
    end
  end
end
