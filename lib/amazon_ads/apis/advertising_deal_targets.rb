# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class AdvertisingDealTargets < API
    # Create advertisingDealTarget
    #: (?advertising_deal_targets: Array[untyped]?) -> HTTP::Response
    def sb_create_advertising_deal_target(advertising_deal_targets: nil)
      request(:post, "/adsApi/v1/create/advertisingDealTargets/sb", json: { "advertisingDealTargets" => advertising_deal_targets }.compact)
    end

    # Delete advertisingDealTarget
    #: (?advertising_deal_target_ids: Array[untyped]?) -> HTTP::Response
    def sb_delete_advertising_deal_target(advertising_deal_target_ids: nil)
      request(:post, "/adsApi/v1/delete/advertisingDealTargets/sb", json: { "advertisingDealTargetIds" => advertising_deal_target_ids }.compact)
    end

    # Query advertisingDealTarget
    #: (advertising_deal_id_filter: String, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def sb_query_advertising_deal_target(advertising_deal_id_filter:, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/advertisingDealTargets/sb", json: { "advertisingDealIdFilter" => advertising_deal_id_filter, "maxResults" => max_results, "nextToken" => next_token }.compact)
    end
  end
end
