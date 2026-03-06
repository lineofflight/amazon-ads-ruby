# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class Targets < API
    # Create target
    #: (?targets: Array[untyped]?) -> HTTP::Response
    def create_target(targets: nil)
      request(:post, "/adsApi/v1/create/targets", json: { "targets" => targets }.compact)
    end

    # Delete target
    #: (?target_ids: Array[untyped]?) -> HTTP::Response
    def delete_target(target_ids: nil)
      request(:post, "/adsApi/v1/delete/targets", json: { "targetIds" => target_ids }.compact)
    end

    # List target
    #: (ad_product_filter: String, ?ad_group_id_filter: String?, ?campaign_id_filter: String?, ?keyword_filter: String?, ?marketplace_scope_filter: String?, ?match_type_filter: String?, ?max_results: Integer?, ?native_language_locale_filter: String?, ?negative_filter: String?, ?next_token: String?, ?product_id_filter: String?, ?state_filter: String?, ?target_id_filter: String?, ?target_type_filter: String?) -> HTTP::Response
    def query_target(ad_product_filter:, ad_group_id_filter: nil, campaign_id_filter: nil, keyword_filter: nil, marketplace_scope_filter: nil, match_type_filter: nil, max_results: nil, native_language_locale_filter: nil, negative_filter: nil, next_token: nil, product_id_filter: nil, state_filter: nil, target_id_filter: nil, target_type_filter: nil)
      request(:post, "/adsApi/v1/query/targets", json: { "adGroupIdFilter" => ad_group_id_filter, "adProductFilter" => ad_product_filter, "campaignIdFilter" => campaign_id_filter, "keywordFilter" => keyword_filter, "marketplaceScopeFilter" => marketplace_scope_filter, "matchTypeFilter" => match_type_filter, "maxResults" => max_results, "nativeLanguageLocaleFilter" => native_language_locale_filter, "negativeFilter" => negative_filter, "nextToken" => next_token, "productIdFilter" => product_id_filter, "stateFilter" => state_filter, "targetIdFilter" => target_id_filter, "targetTypeFilter" => target_type_filter }.compact)
    end

    # Update target
    #: (?targets: Array[untyped]?) -> HTTP::Response
    def update_target(targets: nil)
      request(:post, "/adsApi/v1/update/targets", json: { "targets" => targets }.compact)
    end
  end
end
