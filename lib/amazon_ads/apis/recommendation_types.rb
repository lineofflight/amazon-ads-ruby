# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class RecommendationTypes < API
    # Query RecommendationTypes
    #: (?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def sb_query_recommendation_type(max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/recommendationTypes/sb", json: { "maxResults" => max_results, "nextToken" => next_token }.compact)
    end
  end
end
