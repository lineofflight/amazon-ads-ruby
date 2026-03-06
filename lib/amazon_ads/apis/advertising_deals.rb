# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class AdvertisingDeals < API
    # Create advertisingDeal
    #: (?advertising_deals: Array[untyped]?) -> HTTP::Response
    def sb_create_advertising_deal(advertising_deals: nil)
      request(:post, "/adsApi/v1/create/advertisingDeals/sb", json: { "advertisingDeals" => advertising_deals }.compact)
    end

    # Delete advertisingDeal
    #: (?advertising_deal_ids: Array[untyped]?) -> HTTP::Response
    def sb_delete_advertising_deal(advertising_deal_ids: nil)
      request(:post, "/adsApi/v1/delete/advertisingDeals/sb", json: { "advertisingDealIds" => advertising_deal_ids }.compact)
    end

    # Query advertisingDeal
    #: (?advertising_deal_id_filter: String?, ?max_results: Integer?, ?name_filter: String?, ?next_token: String?) -> HTTP::Response
    def sb_query_advertising_deal(advertising_deal_id_filter: nil, max_results: nil, name_filter: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/advertisingDeals/sb", json: { "advertisingDealIdFilter" => advertising_deal_id_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token }.compact)
    end

    # Update advertisingDeal
    #: (?advertising_deals: Array[untyped]?) -> HTTP::Response
    def sb_update_advertising_deal(advertising_deals: nil)
      request(:post, "/adsApi/v1/update/advertisingDeals/sb", json: { "advertisingDeals" => advertising_deals }.compact)
    end
  end
end
