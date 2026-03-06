# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class BrandedKeywordsPricings < API
    # Create brandedKeywords pricing
    #: (?branded_keywords_pricings: Array[untyped]?) -> HTTP::Response
    def sb_create_branded_keywords_pricing(branded_keywords_pricings: nil)
      request(:post, "/adsApi/v1/create/brandedKeywordsPricings/sb", json: { "brandedKeywordsPricings" => branded_keywords_pricings }.compact)
    end
  end
end
