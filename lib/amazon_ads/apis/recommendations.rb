# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class Recommendations < API
    # Create recommendations
    #: (?recommendations: Array[untyped]?) -> HTTP::Response
    def sb_create_recommendation(recommendations: nil)
      request(:post, "/adsApi/v1/create/recommendations/sb", json: { "recommendations" => recommendations }.compact)
    end
  end
end
