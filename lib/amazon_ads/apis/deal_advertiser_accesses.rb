# frozen_string_literal: true

module AmazonAds
  class DealAdvertiserAccesses < API
    # Create a deal advertiser access record with a strategy (ALLOW or BLOCK)
    #: (deal_advertiser_accesses: Array[untyped]) -> HTTP::Response
    def create_deal_advertiser_access(deal_advertiser_accesses:)
      request(:post, "/adsApi/v1/create/dealAdvertiserAccesses", json: { "dealAdvertiserAccesses" => deal_advertiser_accesses }.compact)
    end

    # Delete a deal advertiser access record and all associated entries
    #: (deal_advertiser_access_ids: Array[untyped]) -> HTTP::Response
    def delete_deal_advertiser_access(deal_advertiser_access_ids:)
      request(:post, "/adsApi/v1/delete/dealAdvertiserAccesses", json: { "dealAdvertiserAccessIds" => deal_advertiser_access_ids }.compact)
    end

    # Retrieve a deal advertiser access record by ID
    #: (deal_advertiser_access_ids: Array[untyped]) -> HTTP::Response
    def retrieve_deal_advertiser_access(deal_advertiser_access_ids:)
      request(:post, "/adsApi/v1/retrieve/dealAdvertiserAccesses", json: { "dealAdvertiserAccessIds" => deal_advertiser_access_ids }.compact)
    end
  end
end
