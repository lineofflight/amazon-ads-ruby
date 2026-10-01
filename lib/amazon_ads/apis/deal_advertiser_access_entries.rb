# frozen_string_literal: true

module AmazonAds
  class DealAdvertiserAccessEntries < API
    # Add advertisers to a deal advertiser access list
    #: (deal_advertiser_access_entries: Array[untyped]) -> HTTP::Response
    def create_deal_advertiser_access_entry(deal_advertiser_access_entries:)
      request(:post, "/adsApi/v1/create/dealAdvertiserAccessEntries", json: { "dealAdvertiserAccessEntries" => deal_advertiser_access_entries }.compact)
    end

    # Remove advertisers from a deal advertiser access list
    #: (deal_advertiser_access_entry_ids: Array[untyped]) -> HTTP::Response
    def delete_deal_advertiser_access_entry(deal_advertiser_access_entry_ids:)
      request(:post, "/adsApi/v1/delete/dealAdvertiserAccessEntries", json: { "dealAdvertiserAccessEntryIds" => deal_advertiser_access_entry_ids }.compact)
    end

    # Query advertiser entries for a deal advertiser access record
    #: (deal_advertiser_access_id_filter: untyped, ?ad_product_filter: untyped?, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def query_deal_advertiser_access_entry(deal_advertiser_access_id_filter:, ad_product_filter: nil, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/dealAdvertiserAccessEntries", json: { "adProductFilter" => ad_product_filter, "dealAdvertiserAccessIdFilter" => deal_advertiser_access_id_filter, "maxResults" => max_results, "nextToken" => next_token }.compact)
    end
  end
end
