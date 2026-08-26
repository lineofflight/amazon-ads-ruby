# frozen_string_literal: true

module AmazonAds
  class SupplierTargetItems < API
    # Fetch supplier target items
    #: (ad_product_filter: untyped, supplier_ad_product_id_filter: untyped, supplier_target_type_filter: untyped, ?category_filter: untyped?, ?countries_filter: untyped?, ?id_filter: untyped?, ?max_results: Integer?, ?name_filter: untyped?, ?next_token: String?, ?sort: Array[untyped]?, ?supplier_proposal_destination_id_filter: untyped?) -> HTTP::Response
    def query_supplier_target_item(ad_product_filter:, supplier_ad_product_id_filter:, supplier_target_type_filter:, category_filter: nil, countries_filter: nil, id_filter: nil, max_results: nil, name_filter: nil, next_token: nil, sort: nil, supplier_proposal_destination_id_filter: nil)
      request(:post, "/adsApi/v1/query/supplierTargetItems", json: { "adProductFilter" => ad_product_filter, "categoryFilter" => category_filter, "countriesFilter" => countries_filter, "idFilter" => id_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "sort" => sort, "supplierAdProductIdFilter" => supplier_ad_product_id_filter, "supplierProposalDestinationIdFilter" => supplier_proposal_destination_id_filter, "supplierTargetTypeFilter" => supplier_target_type_filter }.compact)
    end
  end
end
