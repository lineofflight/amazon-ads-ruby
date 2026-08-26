# frozen_string_literal: true

module AmazonAds
  class ReservedTargetPricings < API
    # Create reservedTarget pricing
    #: (reserved_target_pricings: Array[untyped]) -> HTTP::Response
    def sb_ads_apiv1_create_reserved_target_pricing(reserved_target_pricings:)
      request(:post, "/adsApi/v1/create/reservedTargetPricings/sb", json: { "reservedTargetPricings" => reserved_target_pricings }.compact)
    end
  end
end
