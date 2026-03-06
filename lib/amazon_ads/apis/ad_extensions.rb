# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class AdExtensions < API
    # Create ad extensions - API is in open beta
    #: (?ad_extensions: Array[untyped]?) -> HTTP::Response
    def create_ad_extension(ad_extensions: nil)
      request(:post, "/adsApi/v1/create/adExtensions", json: { "adExtensions" => ad_extensions }.compact)
    end

    # Query ad_extension - API is in open beta
    #: (?ad_extension_id_filter: String?, ?ad_extension_status_filter: String?, ?ad_extension_type_filter: String?, ?ad_group_id_filter: String?, ?ad_id_filter: String?, ?ad_product_filter: String?, ?max_results: Integer?, ?next_token: String?, ?state_filter: String?) -> HTTP::Response
    def query_ad_extension(ad_extension_id_filter: nil, ad_extension_status_filter: nil, ad_extension_type_filter: nil, ad_group_id_filter: nil, ad_id_filter: nil, ad_product_filter: nil, max_results: nil, next_token: nil, state_filter: nil)
      request(:post, "/adsApi/v1/query/adExtensions", json: { "adExtensionIdFilter" => ad_extension_id_filter, "adExtensionStatusFilter" => ad_extension_status_filter, "adExtensionTypeFilter" => ad_extension_type_filter, "adGroupIdFilter" => ad_group_id_filter, "adIdFilter" => ad_id_filter, "adProductFilter" => ad_product_filter, "maxResults" => max_results, "nextToken" => next_token, "stateFilter" => state_filter }.compact)
    end

    # Update ad_extension - API is in open beta
    #: (?ad_extensions: Array[untyped]?) -> HTTP::Response
    def update_ad_extension(ad_extensions: nil)
      request(:post, "/adsApi/v1/update/adExtensions", json: { "adExtensions" => ad_extensions }.compact)
    end
  end
end
