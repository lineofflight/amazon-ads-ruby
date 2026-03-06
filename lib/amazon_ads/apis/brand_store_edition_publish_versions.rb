# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class BrandStoreEditionPublishVersions < API
    # Query store edition publish versions
    #: (edition_id_filter: String, publish_status_filter: String, store_id_filter: String, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def query_brand_store_edition_publish_version(edition_id_filter:, publish_status_filter:, store_id_filter:, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/brandStoreEditionPublishVersions", json: { "editionIdFilter" => edition_id_filter, "maxResults" => max_results, "nextToken" => next_token, "publishStatusFilter" => publish_status_filter, "storeIdFilter" => store_id_filter }.compact)
    end

    # Update store edition publish versions
    #: (?brand_store_edition_publish_versions: Array[untyped]?) -> HTTP::Response
    def update_brand_store_edition_publish_version(brand_store_edition_publish_versions: nil)
      request(:post, "/adsApi/v1/update/brandStoreEditionPublishVersions", json: { "brandStoreEditionPublishVersions" => brand_store_edition_publish_versions }.compact)
    end
  end
end
