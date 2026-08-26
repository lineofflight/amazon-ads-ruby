# frozen_string_literal: true

module AmazonAds
  class SupplierProposals < API
    # Create supplier proposal
    #: (supplier_proposals: Array[untyped]) -> HTTP::Response
    def create_supplier_proposal(supplier_proposals:)
      request(:post, "/adsApi/v1/create/supplierProposals", json: { "supplierProposals" => supplier_proposals }.compact)
    end

    # Query supplier proposal
    #: (ad_product_filter: untyped, advertiser_account_id_filter: untyped, ?countries_filter: untyped?, ?end_date_time_filter: untyped?, ?max_results: Integer?, ?name_filter: untyped?, ?next_token: String?, ?start_date_time_filter: untyped?, ?status_filter: untyped?, ?supplier_proposal_destination_id_filter: untyped?, ?supplier_proposal_id_filter: untyped?) -> HTTP::Response
    def query_supplier_proposal(ad_product_filter:, advertiser_account_id_filter:, countries_filter: nil, end_date_time_filter: nil, max_results: nil, name_filter: nil, next_token: nil, start_date_time_filter: nil, status_filter: nil, supplier_proposal_destination_id_filter: nil, supplier_proposal_id_filter: nil)
      request(:post, "/adsApi/v1/query/supplierProposals", json: { "adProductFilter" => ad_product_filter, "advertiserAccountIdFilter" => advertiser_account_id_filter, "countriesFilter" => countries_filter, "endDateTimeFilter" => end_date_time_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "startDateTimeFilter" => start_date_time_filter, "statusFilter" => status_filter, "supplierProposalDestinationIdFilter" => supplier_proposal_destination_id_filter, "supplierProposalIdFilter" => supplier_proposal_id_filter }.compact)
    end

    # Update supplier proposal
    #: (supplier_proposals: Array[untyped]) -> HTTP::Response
    def update_supplier_proposal(supplier_proposals:)
      request(:post, "/adsApi/v1/update/supplierProposals", json: { "supplierProposals" => supplier_proposals }.compact)
    end
  end
end
