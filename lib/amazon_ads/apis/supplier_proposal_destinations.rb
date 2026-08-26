# frozen_string_literal: true

module AmazonAds
  class SupplierProposalDestinations < API
    # Query supplier proposal destinations
    #: (?max_results: Integer?, ?next_token: String?, ?sort: Array[untyped]?, ?supplier_proposal_destination_id_filter: untyped?, ?supplier_proposal_destination_name_filter: untyped?) -> HTTP::Response
    def query_supplier_proposal_destination(max_results: nil, next_token: nil, sort: nil, supplier_proposal_destination_id_filter: nil, supplier_proposal_destination_name_filter: nil)
      request(:post, "/adsApi/v1/query/supplierProposalDestinations", json: { "maxResults" => max_results, "nextToken" => next_token, "sort" => sort, "supplierProposalDestinationIdFilter" => supplier_proposal_destination_id_filter, "supplierProposalDestinationNameFilter" => supplier_proposal_destination_name_filter }.compact)
    end
  end
end
