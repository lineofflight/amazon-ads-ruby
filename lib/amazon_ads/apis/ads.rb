# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class Ads < API
    # Create ads
    #: (?ads: Array[untyped]?) -> HTTP::Response
    def create_ad(ads: nil)
      request(:post, "/adsApi/v1/create/ads", json: { "ads" => ads }.compact)
    end

    # Delete ads
    #: (?ad_ids: Array[untyped]?) -> HTTP::Response
    def delete_ad(ad_ids: nil)
      request(:post, "/adsApi/v1/delete/ads", json: { "adIds" => ad_ids }.compact)
    end

    # List ads
    #: (ad_product_filter: String, ?ad_group_id_filter: String?, ?ad_id_filter: String?, ?campaign_id_filter: String?, ?marketplace_scope_filter: String?, ?max_results: Integer?, ?name_filter: String?, ?next_token: String?, ?state_filter: String?) -> HTTP::Response
    def query_ad(ad_product_filter:, ad_group_id_filter: nil, ad_id_filter: nil, campaign_id_filter: nil, marketplace_scope_filter: nil, max_results: nil, name_filter: nil, next_token: nil, state_filter: nil)
      request(:post, "/adsApi/v1/query/ads", json: { "adGroupIdFilter" => ad_group_id_filter, "adIdFilter" => ad_id_filter, "adProductFilter" => ad_product_filter, "campaignIdFilter" => campaign_id_filter, "marketplaceScopeFilter" => marketplace_scope_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "stateFilter" => state_filter }.compact)
    end

    # Update ads
    #: (?ads: Array[untyped]?) -> HTTP::Response
    def update_ad(ads: nil)
      request(:post, "/adsApi/v1/update/ads", json: { "ads" => ads }.compact)
    end
  end
end
