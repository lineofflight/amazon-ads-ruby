# frozen_string_literal: true

module AmazonAds
  class SupplierProposedDeals < API
    # Create supplier proposed deal
    #: (supplier_proposed_deals: Array[untyped]) -> HTTP::Response
    def create_supplier_proposed_deal(supplier_proposed_deals:)
      request(:post, "/adsApi/v1/create/supplierProposedDeals", json: { "supplierProposedDeals" => supplier_proposed_deals }.compact)
    end

    # Query supplier proposed deals
    #: (ad_product_filter: untyped, advertiser_account_id_filter: untyped, ?advertising_deal_id_filter: untyped?, ?deal_name_filter: untyped?, ?deal_status_filter: untyped?, ?deal_type_filter: untyped?, ?end_date_time_filter: untyped?, ?external_deal_id_filter: untyped?, ?max_results: Integer?, ?next_token: String?, ?start_date_time_filter: untyped?, ?supplier_proposal_destination_id_filter: untyped?, ?supplier_proposal_id_filter: untyped?, ?supplier_proposed_deal_id_filter: untyped?, ?value_filter: untyped?) -> HTTP::Response
    def query_supplier_proposed_deal(ad_product_filter:, advertiser_account_id_filter:, advertising_deal_id_filter: nil, deal_name_filter: nil, deal_status_filter: nil, deal_type_filter: nil, end_date_time_filter: nil, external_deal_id_filter: nil, max_results: nil, next_token: nil, start_date_time_filter: nil, supplier_proposal_destination_id_filter: nil, supplier_proposal_id_filter: nil, supplier_proposed_deal_id_filter: nil, value_filter: nil)
      request(:post, "/adsApi/v1/query/supplierProposedDeals", json: { "adProductFilter" => ad_product_filter, "advertiserAccountIdFilter" => advertiser_account_id_filter, "advertisingDealIdFilter" => advertising_deal_id_filter, "dealNameFilter" => deal_name_filter, "dealStatusFilter" => deal_status_filter, "dealTypeFilter" => deal_type_filter, "endDateTimeFilter" => end_date_time_filter, "externalDealIdFilter" => external_deal_id_filter, "maxResults" => max_results, "nextToken" => next_token, "startDateTimeFilter" => start_date_time_filter, "supplierProposalDestinationIdFilter" => supplier_proposal_destination_id_filter, "supplierProposalIdFilter" => supplier_proposal_id_filter, "supplierProposedDealIdFilter" => supplier_proposed_deal_id_filter, "valueFilter" => value_filter }.compact)
    end

    # Update supplier proposed deal
    #: (supplier_proposed_deals: Array[untyped]) -> HTTP::Response
    def update_supplier_proposed_deal(supplier_proposed_deals:)
      request(:post, "/adsApi/v1/update/supplierProposedDeals", json: { "supplierProposedDeals" => supplier_proposed_deals }.compact)
    end
  end
end
