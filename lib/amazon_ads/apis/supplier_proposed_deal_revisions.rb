# frozen_string_literal: true

module AmazonAds
  class SupplierProposedDealRevisions < API
    # Create supplier proposed deal revision
    #: (supplier_proposed_deal_revisions: Array[untyped]) -> HTTP::Response
    def create_supplier_proposed_deal_revision(supplier_proposed_deal_revisions:)
      request(:post, "/adsApi/v1/create/supplierProposedDealRevisions", json: { "supplierProposedDealRevisions" => supplier_proposed_deal_revisions }.compact)
    end

    # Update supplier proposed deal revision
    #: (supplier_proposed_deal_revisions: Array[untyped]) -> HTTP::Response
    def update_supplier_proposed_deal_revision(supplier_proposed_deal_revisions:)
      request(:post, "/adsApi/v1/update/supplierProposedDealRevisions", json: { "supplierProposedDealRevisions" => supplier_proposed_deal_revisions }.compact)
    end
  end
end
