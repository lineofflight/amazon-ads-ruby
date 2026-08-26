# frozen_string_literal: true

module AmazonAds
  class SupplierPublishers < API
    # Query supplier publishers
    #: (supplier_publisher_type_filter: untyped, ?max_results: Integer?, ?name_filter: untyped?, ?next_token: String?, ?sort: Array[untyped]?) -> HTTP::Response
    def query_supplier_publisher(supplier_publisher_type_filter:, max_results: nil, name_filter: nil, next_token: nil, sort: nil)
      request(:post, "/adsApi/v1/query/supplierPublishers", json: { "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "sort" => sort, "supplierPublisherTypeFilter" => supplier_publisher_type_filter }.compact)
    end
  end
end
