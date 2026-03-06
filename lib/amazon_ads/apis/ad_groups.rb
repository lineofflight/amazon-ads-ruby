# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class AdGroups < API
    # Create ad groups
    #: (?ad_groups: Array[untyped]?) -> HTTP::Response
    def create_ad_group(ad_groups: nil)
      request(:post, "/adsApi/v1/create/adGroups", json: { "adGroups" => ad_groups }.compact)
    end

    # Delete ad groups
    #: (?ad_group_ids: Array[untyped]?) -> HTTP::Response
    def delete_ad_group(ad_group_ids: nil)
      request(:post, "/adsApi/v1/delete/adGroups", json: { "adGroupIds" => ad_group_ids }.compact)
    end

    # List ad groups
    #: (ad_product_filter: String, ?ad_group_id_filter: String?, ?campaign_id_filter: String?, ?marketplace_scope_filter: String?, ?max_results: Integer?, ?name_filter: String?, ?next_token: String?, ?state_filter: String?) -> HTTP::Response
    def query_ad_group(ad_product_filter:, ad_group_id_filter: nil, campaign_id_filter: nil, marketplace_scope_filter: nil, max_results: nil, name_filter: nil, next_token: nil, state_filter: nil)
      request(:post, "/adsApi/v1/query/adGroups", json: { "adGroupIdFilter" => ad_group_id_filter, "adProductFilter" => ad_product_filter, "campaignIdFilter" => campaign_id_filter, "marketplaceScopeFilter" => marketplace_scope_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "stateFilter" => state_filter }.compact)
    end

    # Update ad groups
    #: (?ad_groups: Array[untyped]?) -> HTTP::Response
    def update_ad_group(ad_groups: nil)
      request(:post, "/adsApi/v1/update/adGroups", json: { "adGroups" => ad_groups }.compact)
    end
  end
end
