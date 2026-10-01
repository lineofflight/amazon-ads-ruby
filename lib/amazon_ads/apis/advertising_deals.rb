# frozen_string_literal: true

module AmazonAds
  class AdvertisingDeals < API
    # Create advertising deals
    #: (advertising_deals: Array[untyped]) -> HTTP::Response
    def create_advertising_deal(advertising_deals:)
      request(:post, "/adsApi/v1/create/advertisingDeals", json: { "advertisingDeals" => advertising_deals }.compact)
    end

    # Query advertising deals with filters
    #: (ad_product_filter: untyped, ?advertising_deal_id_filter: untyped?, ?broadcasters_filter: untyped?, ?country_code_filter: untyped?, ?creation_date_time_range_filter: untyped?, ?deal_type_filter: untyped?, ?end_date_time_range_filter: untyped?, ?exchange_deal_id_filter: untyped?, ?exchange_id_filter: untyped?, ?leagues_filter: untyped?, ?marketplace_deal_filter: untyped?, ?max_results: Integer?, ?name_filter: untyped?, ?next_token: String?, ?price_range_filter: untyped?, ?price_type_filter: untyped?, ?sort: Array[untyped]?, ?sports_filter: untyped?, ?start_date_time_range_filter: untyped?, ?status_filter: untyped?, ?supply_inventory_types_filter: untyped?) -> HTTP::Response
    def query_advertising_deal(ad_product_filter:, advertising_deal_id_filter: nil, broadcasters_filter: nil, country_code_filter: nil, creation_date_time_range_filter: nil, deal_type_filter: nil, end_date_time_range_filter: nil, exchange_deal_id_filter: nil, exchange_id_filter: nil, leagues_filter: nil, marketplace_deal_filter: nil, max_results: nil, name_filter: nil, next_token: nil, price_range_filter: nil, price_type_filter: nil, sort: nil, sports_filter: nil, start_date_time_range_filter: nil, status_filter: nil, supply_inventory_types_filter: nil)
      request(:post, "/adsApi/v1/query/advertisingDeals", json: { "adProductFilter" => ad_product_filter, "advertisingDealIdFilter" => advertising_deal_id_filter, "broadcastersFilter" => broadcasters_filter, "countryCodeFilter" => country_code_filter, "creationDateTimeRangeFilter" => creation_date_time_range_filter, "dealTypeFilter" => deal_type_filter, "endDateTimeRangeFilter" => end_date_time_range_filter, "exchangeDealIdFilter" => exchange_deal_id_filter, "exchangeIdFilter" => exchange_id_filter, "leaguesFilter" => leagues_filter, "marketplaceDealFilter" => marketplace_deal_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "priceRangeFilter" => price_range_filter, "priceTypeFilter" => price_type_filter, "sort" => sort, "sportsFilter" => sports_filter, "startDateTimeRangeFilter" => start_date_time_range_filter, "statusFilter" => status_filter, "supplyInventoryTypesFilter" => supply_inventory_types_filter }.compact)
    end

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
    #: (?advertising_deal_id_filter: untyped?, ?max_results: Integer?, ?name_filter: untyped?, ?next_token: String?) -> HTTP::Response
    def sb_query_advertising_deal(advertising_deal_id_filter: nil, max_results: nil, name_filter: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/advertisingDeals/sb", json: { "advertisingDealIdFilter" => advertising_deal_id_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token }.compact)
    end

    # Update advertisingDeal
    #: (?advertising_deals: Array[untyped]?) -> HTTP::Response
    def sb_update_advertising_deal(advertising_deals: nil)
      request(:post, "/adsApi/v1/update/advertisingDeals/sb", json: { "advertisingDeals" => advertising_deals }.compact)
    end

    # Update advertising deals
    #: (advertising_deals: Array[untyped]) -> HTTP::Response
    def update_advertising_deal(advertising_deals:)
      request(:post, "/adsApi/v1/update/advertisingDeals", json: { "advertisingDeals" => advertising_deals }.compact)
    end
  end
end
