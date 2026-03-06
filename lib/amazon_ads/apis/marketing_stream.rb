# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  # Amazon Marketing Stream
  class MarketingStream < API
    # Create a new subscription Note: trailing slash in request uri is not allowed
    # @rbs client_request_token: String -- Unique value supplied by the caller used to track identical API requests. Should request be re-tried, the caller should supply the same value. We recommend using GUID.
    # @rbs data_set_id: String -- Identifier of data set, callers can be subscribed to. Please refer to https://advertising.amazon.com/API/docs/en-us/amazon-marketing-stream/data-guide for the list of all data sets.
    # @rbs destination_arn: String -- AWS ARN of the destination endpoint associated with the subscription. Supported destination types: - SQS
    # @rbs notes: String -- Additional details associated with the subscription
    #: (client_request_token: String, data_set_id: String, ?destination: String?, ?destination_arn: String?, ?notes: String?) -> HTTP::Response
    def create_dsp_stream_subscription(client_request_token:, data_set_id:, destination: nil, destination_arn: nil, notes: nil)
      request(:post, "/dsp/streams/subscriptions", json: { "clientRequestToken" => client_request_token, "dataSetId" => data_set_id, "destination" => destination, "destinationArn" => destination_arn, "notes" => notes }.compact, headers: { "Content-Type" => "application/vnd.amazonmarketingstreamsubscriptions.v1+json" })
    end

    # Create a new subscription Note: trailing slash in request uri is not allowed
    # @rbs client_request_token: String -- Unique value supplied by the caller used to track identical API requests. Should request be re-tried, the caller should supply the same value. We recommend using GUID.
    # @rbs data_set_id: String -- Identifier of data set, callers can be subscribed to. Please refer to https://advertising.amazon.com/API/docs/en-us/amazon-marketing-stream/data-guide for the list of all data sets.
    # @rbs destination_arn: String -- AWS ARN of the destination endpoint associated with the subscription. Supported destination types: - SQS
    # @rbs notes: String -- Additional details associated with the subscription
    #: (client_request_token: String, data_set_id: String, ?destination: String?, ?destination_arn: String?, ?notes: String?) -> HTTP::Response
    def create_stream_subscription(client_request_token:, data_set_id:, destination: nil, destination_arn: nil, notes: nil)
      request(:post, "/streams/subscriptions", json: { "clientRequestToken" => client_request_token, "dataSetId" => data_set_id, "destination" => destination, "destinationArn" => destination_arn, "notes" => notes }.compact, headers: { "Content-Type" => "application/vnd.amazonmarketingstreamsubscriptions.v1+json" })
    end

    # Fetch a specific subscription by Id Note: trailing slash in request uri is not allowed
    # @rbs subscription_id: String -- Unique subscription identifier
    #: (String) -> HTTP::Response
    def get_dsp_stream_subscription(subscription_id)
      request(:get, "/dsp/streams/subscriptions/#{subscription_id}")
    end

    # Fetch a specific subscription by Id Note: trailing slash in request uri is not allowed
    # @rbs subscription_id: String -- Unique subscription identifier
    #: (String) -> HTTP::Response
    def get_stream_subscription(subscription_id)
      request(:get, "/streams/subscriptions/#{subscription_id}")
    end

    # List subscriptions Note: trailing slash in request uri is not allowed
    # @rbs max_results: Numeric -- desired number of entries in the response, defaults to maximum value
    # @rbs starting_token: String -- Token which can be used to get the next page of results, if more entries exist
    #: (?max_results: Numeric?, ?starting_token: String?) -> HTTP::Response
    def list_dsp_stream_subscriptions(max_results: nil, starting_token: nil)
      request(:get, "/dsp/streams/subscriptions", params: { "maxResults" => max_results, "startingToken" => starting_token }.compact)
    end

    # List subscriptions Note: trailing slash in request uri is not allowed
    # @rbs max_results: Numeric -- desired number of entries in the response, defaults to maximum value
    # @rbs starting_token: String -- Token which can be used to get the next page of results, if more entries exist
    #: (?max_results: Numeric?, ?starting_token: String?) -> HTTP::Response
    def list_stream_subscriptions(max_results: nil, starting_token: nil)
      request(:get, "/streams/subscriptions", params: { "maxResults" => max_results, "startingToken" => starting_token }.compact)
    end

    # Update an existing subscription Note: trailing slash in request uri is not allowed
    # @rbs subscription_id: String -- Unique subscription identifier
    # @rbs notes: String -- Additional details associated with the subscription
    #: (String, ?notes: String?, ?status: String?) -> HTTP::Response
    def update_dsp_stream_subscription(subscription_id, notes: nil, status: nil)
      request(:put, "/dsp/streams/subscriptions/#{subscription_id}", json: { "notes" => notes, "status" => status }.compact, headers: { "Content-Type" => "application/vnd.amazonmarketingstreamsubscriptions.v1+json" })
    end

    # Update an existing subscription Note: trailing slash in request uri is not allowed
    # @rbs subscription_id: String -- Unique subscription identifier
    # @rbs notes: String -- Additional details associated with the subscription
    #: (String, ?notes: String?, ?status: String?) -> HTTP::Response
    def update_stream_subscription(subscription_id, notes: nil, status: nil)
      request(:put, "/streams/subscriptions/#{subscription_id}", json: { "notes" => notes, "status" => status }.compact, headers: { "Content-Type" => "application/vnd.amazonmarketingstreamsubscriptions.v1+json" })
    end
  end
end
