# frozen_string_literal: true

module AmazonAds
  class ManagerAccounts < API
    # Create manager accounts
    #: (manager_accounts: Array[untyped]) -> HTTP::Response
    def create_manager_account(manager_accounts:)
      request(:post, "/adsApi/v1/create/managerAccounts", json: { "managerAccounts" => manager_accounts }.compact)
    end

    # List manager accounts
    #: (?manager_account_id_filter: untyped?, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def query_manager_account(manager_account_id_filter: nil, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/managerAccounts", json: { "managerAccountIdFilter" => manager_account_id_filter, "maxResults" => max_results, "nextToken" => next_token }.compact)
    end

    # Update manager accounts
    #: (manager_accounts: Array[untyped]) -> HTTP::Response
    def update_manager_account(manager_accounts:)
      request(:post, "/adsApi/v1/update/managerAccounts", json: { "managerAccounts" => manager_accounts }.compact)
    end
  end
end
