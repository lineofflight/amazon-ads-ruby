# frozen_string_literal: true

module AmazonAds
  class SupplierAdProducts < API
    # Query supplier ad products
    #: (ad_product_filter: untyped, ?country_filter: untyped?, ?deal_type_filter: untyped?, ?inventory_type_filter: untyped?, ?max_date_time_filter: untyped?, ?max_results: Integer?, ?min_date_time_filter: untyped?, ?name_filter: untyped?, ?next_token: String?, ?sort: Array[untyped]?, ?supplier_ad_product_id_filter: untyped?, ?supplier_proposal_destination_id_filter: untyped?, ?supplier_publisher_id_filter: untyped?) -> HTTP::Response
    def query_supplier_ad_product(ad_product_filter:, country_filter: nil, deal_type_filter: nil, inventory_type_filter: nil, max_date_time_filter: nil, max_results: nil, min_date_time_filter: nil, name_filter: nil, next_token: nil, sort: nil, supplier_ad_product_id_filter: nil, supplier_proposal_destination_id_filter: nil, supplier_publisher_id_filter: nil)
      request(:post, "/adsApi/v1/query/supplierAdProducts", json: { "adProductFilter" => ad_product_filter, "countryFilter" => country_filter, "dealTypeFilter" => deal_type_filter, "inventoryTypeFilter" => inventory_type_filter, "maxDateTimeFilter" => max_date_time_filter, "maxResults" => max_results, "minDateTimeFilter" => min_date_time_filter, "nameFilter" => name_filter, "nextToken" => next_token, "sort" => sort, "supplierAdProductIdFilter" => supplier_ad_product_id_filter, "supplierProposalDestinationIdFilter" => supplier_proposal_destination_id_filter, "supplierPublisherIdFilter" => supplier_publisher_id_filter }.compact)
    end
  end
end
