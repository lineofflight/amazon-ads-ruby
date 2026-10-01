# frozen_string_literal: true

module AmazonAds
  class LabelObjectAssociations < API
    # Query label-to-object associations with filters.
    #: (label_object_type_filter: untyped, ?ad_product_filter: untyped?, ?label_id_filter: untyped?, ?label_object_id_filter: untyped?, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def query_label_object_association(label_object_type_filter:, ad_product_filter: nil, label_id_filter: nil, label_object_id_filter: nil, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/labelObjectAssociations", json: { "adProductFilter" => ad_product_filter, "labelIdFilter" => label_id_filter, "labelObjectIdFilter" => label_object_id_filter, "labelObjectTypeFilter" => label_object_type_filter, "maxResults" => max_results, "nextToken" => next_token }.compact)
    end
  end
end
