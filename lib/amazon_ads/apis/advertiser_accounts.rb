# frozen_string_literal: true

module AmazonAds
  class AdvertiserAccounts < API
    # Create advertiser accounts
    #: (advertiser_accounts: Array[untyped]) -> HTTP::Response
    def create_advertiser_account(advertiser_accounts:)
      request(:post, "/adsApi/v1/create/advertiserAccounts", json: { "advertiserAccounts" => advertiser_accounts }.compact)
    end

    # List advertiser accounts
    #: (?advertiser_account_id_filter: untyped?, ?is_global_account_filter: untyped?, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def query_advertiser_account(advertiser_account_id_filter: nil, is_global_account_filter: nil, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/advertiserAccounts", json: { "advertiserAccountIdFilter" => advertiser_account_id_filter, "isGlobalAccountFilter" => is_global_account_filter, "maxResults" => max_results, "nextToken" => next_token }.compact)
    end

    # Update advertiser accounts
    #: (advertiser_accounts: Array[untyped]) -> HTTP::Response
    def update_advertiser_account(advertiser_accounts:)
      request(:post, "/adsApi/v1/update/advertiserAccounts", json: { "advertiserAccounts" => advertiser_accounts }.compact)
    end
  end
end
