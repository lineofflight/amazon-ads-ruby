# frozen_string_literal: true

module AmazonAds
  class DealPreferences < API
    # Creates one or more deal preferences for a DSP advertiser account.
    #: (deal_preferences: Array[untyped]) -> HTTP::Response
    def create_deal_preference(deal_preferences:)
      request(:post, "/adsApi/v1/create/dealPreferences", json: { "dealPreferences" => deal_preferences }.compact)
    end

    # Lists deal preferences for a DSP advertiser account.
    #: (?next_token: String?, ?max_results: Integer?) -> HTTP::Response
    def list_deal_preference(next_token: nil, max_results: nil)
      request(:get, "/adsApi/v1/dealPreferences", params: { "nextToken" => next_token, "maxResults" => max_results }.compact)
    end
  end
end
