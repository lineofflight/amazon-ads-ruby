# frozen_string_literal: true

module AmazonAds
  class Publishers < API
    # Query publishers. A publisher is a business entity that operates the apps, sites, or video streams where ads are displayed. Use this API to search publishers by ID or name, for example to understand and compare where your ads run.
    #: (ad_product_filter: untyped, ?max_results: Integer?, ?name_filter: untyped?, ?next_token: String?, ?publisher_id_filter: untyped?, ?publisher_owner_id_filter: untyped?, ?root_domain_filter: untyped?, ?sort: Array[untyped]?) -> HTTP::Response
    def query_publisher(ad_product_filter:, max_results: nil, name_filter: nil, next_token: nil, publisher_id_filter: nil, publisher_owner_id_filter: nil, root_domain_filter: nil, sort: nil)
      request(:post, "/adsApi/v1/query/publishers", json: { "adProductFilter" => ad_product_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "publisherIdFilter" => publisher_id_filter, "publisherOwnerIdFilter" => publisher_owner_id_filter, "rootDomainFilter" => root_domain_filter, "sort" => sort }.compact)
    end
  end
end
