# frozen_string_literal: true

module AmazonAds
  class Sellers < API
    # Query sellers. A seller is a business entity that has the rights to sell a publisher's advertising inventory and holds accounts with suppliers that send that inventory to Amazon DSP. Use this API to search sellers by ID or name, for example to identify a seller when creating a deal or commitment.
    #: (ad_product_filter: untyped, ?max_results: Integer?, ?name_filter: untyped?, ?next_token: String?, ?seller_id_filter: untyped?, ?seller_parent_id_filter: untyped?, ?sort: Array[untyped]?) -> HTTP::Response
    def query_seller(ad_product_filter:, max_results: nil, name_filter: nil, next_token: nil, seller_id_filter: nil, seller_parent_id_filter: nil, sort: nil)
      request(:post, "/adsApi/v1/query/sellers", json: { "adProductFilter" => ad_product_filter, "maxResults" => max_results, "nameFilter" => name_filter, "nextToken" => next_token, "sellerIdFilter" => seller_id_filter, "sellerParentIdFilter" => seller_parent_id_filter, "sort" => sort }.compact)
    end
  end
end
