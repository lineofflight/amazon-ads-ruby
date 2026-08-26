# frozen_string_literal: true

module AmazonAds
  class SupplierProposedDealHistoricalVersions < API
    # Query supplier proposed deal historical versions
    #: (ad_product_filter: untyped, supplier_proposal_destination_id_filter: untyped, supplier_proposed_deal_id_filter: untyped, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def query_supplier_proposed_deal_historical_version(ad_product_filter:, supplier_proposal_destination_id_filter:, supplier_proposed_deal_id_filter:, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/supplierProposedDealHistoricalVersions", json: { "adProductFilter" => ad_product_filter, "maxResults" => max_results, "nextToken" => next_token, "supplierProposalDestinationIdFilter" => supplier_proposal_destination_id_filter, "supplierProposedDealIdFilter" => supplier_proposed_deal_id_filter }.compact)
    end
  end
end
