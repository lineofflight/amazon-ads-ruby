# frozen_string_literal: true

module AmazonAds
  class Suppliers < API
    # Query suppliers. A supplier is a business entity that sends advertising inventory to Amazon DSP, either through direct publisher relationships or as an intermediary such as a supply-side platform (SSP). Use this API to search suppliers by ID or name, or to find the suppliers that can serve a given inventory type or delivery channel in the open auction.
    #: (ad_product_filter: untyped, ?integration_type_filter: untyped?, ?max_results: Integer?, ?next_token: String?, ?open_auction_delivery_channels_filter: untyped?, ?open_auction_device_types_filter: untyped?, ?open_auction_inventory_types_filter: untyped?, ?sort: Array[untyped]?, ?state_filter: untyped?, ?supplier_id_filter: untyped?, ?supplier_name_filter: untyped?, ?type_filter: untyped?) -> HTTP::Response
    def query_supplier(ad_product_filter:, integration_type_filter: nil, max_results: nil, next_token: nil, open_auction_delivery_channels_filter: nil, open_auction_device_types_filter: nil, open_auction_inventory_types_filter: nil, sort: nil, state_filter: nil, supplier_id_filter: nil, supplier_name_filter: nil, type_filter: nil)
      request(:post, "/adsApi/v1/query/suppliers", json: { "adProductFilter" => ad_product_filter, "integrationTypeFilter" => integration_type_filter, "maxResults" => max_results, "nextToken" => next_token, "openAuctionDeliveryChannelsFilter" => open_auction_delivery_channels_filter, "openAuctionDeviceTypesFilter" => open_auction_device_types_filter, "openAuctionInventoryTypesFilter" => open_auction_inventory_types_filter, "sort" => sort, "stateFilter" => state_filter, "supplierIdFilter" => supplier_id_filter, "supplierNameFilter" => supplier_name_filter, "typeFilter" => type_filter }.compact)
    end
  end
end
