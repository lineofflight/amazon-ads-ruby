# frozen_string_literal: true

module AmazonAds
  class SupplierAdProductPrices < API
    # Create supplier ad product price
    #: (supplier_ad_product_prices: Array[untyped]) -> HTTP::Response
    def create_supplier_ad_product_price(supplier_ad_product_prices:)
      request(:post, "/adsApi/v1/create/supplierAdProductPrices", json: { "supplierAdProductPrices" => supplier_ad_product_prices }.compact)
    end
  end
end
