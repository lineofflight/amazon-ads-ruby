# frozen_string_literal: true

module AmazonAds
  class Labels < API
    # Query labels with filters. Returns labels that have associations of the specified object type and are visible to the caller's entity.
    #: (label_object_type_filter: untyped, ?ad_product_filter: untyped?, ?label_id_filter: untyped?, ?label_name_filter: untyped?, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def query_label(label_object_type_filter:, ad_product_filter: nil, label_id_filter: nil, label_name_filter: nil, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/labels", json: { "adProductFilter" => ad_product_filter, "labelIdFilter" => label_id_filter, "labelNameFilter" => label_name_filter, "labelObjectTypeFilter" => label_object_type_filter, "maxResults" => max_results, "nextToken" => next_token }.compact)
    end
  end
end
