# frozen_string_literal: true

module AmazonAds
  class SupplierProposedDealForecasts < API
    # Create supplier proposed deal forecast
    #: (supplier_proposed_deal_forecasts: Array[untyped]) -> HTTP::Response
    def create_supplier_proposed_deal_forecast(supplier_proposed_deal_forecasts:)
      request(:post, "/adsApi/v1/create/supplierProposedDealForecasts", json: { "supplierProposedDealForecasts" => supplier_proposed_deal_forecasts }.compact)
    end
  end
end
