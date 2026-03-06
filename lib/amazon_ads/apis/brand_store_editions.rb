# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class BrandStoreEditions < API
    # Retrieve brand store page content
    #: (brand_store_id: String, ?next_token: String?, ?max_results: Integer?) -> HTTP::Response
    def list_brand_store_edition(brand_store_id:, next_token: nil, max_results: nil)
      request(:get, "/adsApi/v1/brandStoreEditions", params: { "brandStoreId" => brand_store_id, "nextToken" => next_token, "maxResults" => max_results }.compact)
    end
  end
end
