# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class BrandStorePages < API
    # Retrieve brand store page content
    #: (edition_id_filter: String, page_id_filter: String, store_id_filter: String, ?max_results: Integer?, ?next_token: String?, ?store_edition_publish_id_filter: String?) -> HTTP::Response
    def query_brand_store_page(edition_id_filter:, page_id_filter:, store_id_filter:, max_results: nil, next_token: nil, store_edition_publish_id_filter: nil)
      request(:post, "/adsApi/v1/query/brandStorePages", json: { "editionIdFilter" => edition_id_filter, "maxResults" => max_results, "nextToken" => next_token, "pageIdFilter" => page_id_filter, "storeEditionPublishIdFilter" => store_edition_publish_id_filter, "storeIdFilter" => store_id_filter }.compact)
    end
  end
end
