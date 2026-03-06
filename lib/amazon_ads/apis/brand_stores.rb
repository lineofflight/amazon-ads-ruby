# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class BrandStores < API
    # Query brand store content
    #: (store_name_filter: String, ?max_results: Integer?, ?next_token: String?, ?sort: Array[untyped]?) -> HTTP::Response
    def query_brand_store(store_name_filter:, max_results: nil, next_token: nil, sort: nil)
      request(:post, "/adsApi/v1/query/brandStores", json: { "maxResults" => max_results, "nextToken" => next_token, "sort" => sort, "storeNameFilter" => store_name_filter }.compact)
    end
  end
end
