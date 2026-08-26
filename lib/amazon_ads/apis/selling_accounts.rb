# frozen_string_literal: true

module AmazonAds
  class SellingAccounts < API
    # List selling accounts
    #: (?max_results: Integer?, ?next_token: String?, ?selling_account_link_token_filter: untyped?, ?selling_program_filter: untyped?) -> HTTP::Response
    def query_selling_account(max_results: nil, next_token: nil, selling_account_link_token_filter: nil, selling_program_filter: nil)
      request(:post, "/adsApi/v1/query/sellingAccounts", json: { "maxResults" => max_results, "nextToken" => next_token, "sellingAccountLinkTokenFilter" => selling_account_link_token_filter, "sellingProgramFilter" => selling_program_filter }.compact)
    end
  end
end
