# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class Campaigns < API
    # Create campaigns
    #: (?campaigns: Array[untyped]?) -> HTTP::Response
    def create_campaign(campaigns: nil)
      request(:post, "/adsApi/v1/create/campaigns", json: { "campaigns" => campaigns }.compact)
    end

    # Delete campaigns
    #: (?campaign_ids: Array[untyped]?) -> HTTP::Response
    def delete_campaign(campaign_ids: nil)
      request(:post, "/adsApi/v1/delete/campaigns", json: { "campaignIds" => campaign_ids }.compact)
    end

    # Query campaign
    #: (ad_product_filter: String, ?campaign_id_filter: String?, ?goal_filter: String?, ?marketplace_scope_filter: String?, ?max_results: Integer?, ?name_filter: String?, ?next_token: String?, ?portfolio_id_filter: String?, ?state_filter: String?) -> HTTP::Response
    def query_campaign(ad_product_filter:, campaign_id_filter: nil, goal_filter: nil, marketplace_scope_filter: nil, max_results: nil, name_filter: nil, next_token: nil, portfolio_id_filter: nil, state_filter: nil)
      request(:post, "/adsApi/v1/query/campaigns", json: { "adProductFilter" => ad_product_filter, "campaignIdFilter" => campaign_id_filter, "goalFilter" => goal_filter, "marketplaceScopeFilter" => marketplace_scope_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "portfolioIdFilter" => portfolio_id_filter, "stateFilter" => state_filter }.compact)
    end

    # Update campaign
    #: (?campaigns: Array[untyped]?) -> HTTP::Response
    def update_campaign(campaigns: nil)
      request(:post, "/adsApi/v1/update/campaigns", json: { "campaigns" => campaigns }.compact)
    end
  end
end
