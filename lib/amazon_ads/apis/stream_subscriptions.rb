# frozen_string_literal: true

module AmazonAds
  class StreamSubscriptions < API
    # Create a new subscription\nNote: trailing slash in request uri is not allowed
    #: (access_requested_accounts: Array[untyped], stream_subscriptions: Array[untyped]) -> HTTP::Response
    def ads_apiv1_create_stream_subscription(access_requested_accounts:, stream_subscriptions:)
      request(:post, "/adsApi/v1/create/streamSubscriptions", json: { "accessRequestedAccounts" => access_requested_accounts, "streamSubscriptions" => stream_subscriptions }.compact)
    end

    # Archive an existing subscription Note: trailing slash in request uri is not allowed
    #: (access_requested_accounts: Array[untyped], stream_subscription_ids: Array[untyped]) -> HTTP::Response
    def ads_apiv1_delete_stream_subscription(access_requested_accounts:, stream_subscription_ids:)
      request(:post, "/adsApi/v1/delete/streamSubscriptions", json: { "accessRequestedAccounts" => access_requested_accounts, "streamSubscriptionIds" => stream_subscription_ids }.compact)
    end

    # Query subscriptions Note: trailing slash in request uri is not allowed
    #: (access_requested_accounts: Array[untyped], ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def ads_apiv1_query_stream_subscription(access_requested_accounts:, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/streamSubscriptions", json: { "accessRequestedAccounts" => access_requested_accounts, "maxResults" => max_results, "nextToken" => next_token }.compact)
    end

    # Fetch a specific subscription by Id Note: trailing slash in request uri is not allowed
    #: (access_requested_accounts: Array[untyped], stream_subscription_ids: Array[untyped]) -> HTTP::Response
    def ads_apiv1_retrieve_stream_subscription(access_requested_accounts:, stream_subscription_ids:)
      request(:post, "/adsApi/v1/retrieve/streamSubscriptions", json: { "accessRequestedAccounts" => access_requested_accounts, "streamSubscriptionIds" => stream_subscription_ids }.compact)
    end
  end
end
