# frozen_string_literal: true

module AmazonAds
  class LocationIndexes < API
    # Create a Smart Location Index. A Smart Location Index is a named dataset that maps postal codes to index values representing relative audience quality or sales potential for a given advertiser. Index data is processed asynchronously; the index status will transition from PENDING to ENABLED once processing is complete.
    #: (location_indexes: Array[untyped]) -> HTTP::Response
    def create_location_index(location_indexes:)
      request(:post, "/adsApi/v1/create/locationIndexes", json: { "locationIndexes" => location_indexes }.compact)
    end

    # List all Smart Location Indexes for the authenticated advertiser. Returns a paginated collection of indexes including their current processing status. Use the nextToken from the response to retrieve subsequent pages.
    #: (?next_token: String?, ?max_results: Integer?) -> HTTP::Response
    def list_location_index(next_token: nil, max_results: nil)
      request(:get, "/adsApi/v1/locationIndexes", params: { "nextToken" => next_token, "maxResults" => max_results }.compact)
    end

    # Retrieve one or more Smart Location Indexes by ID. Returns the current metadata and processing status for each requested index. An index with status PENDING is still being processed and is not yet available for use in smart location targeting.
    #: (index_ids: Array[untyped]) -> HTTP::Response
    def retrieve_location_index(index_ids:)
      request(:post, "/adsApi/v1/retrieve/locationIndexes", json: { "indexIds" => index_ids }.compact)
    end

    # Update the data for an existing Smart Location Index. Replaces the index's postal code values with the provided dataset. The update is processed asynchronously; the index status will return to PENDING until the new data has been fully processed.
    #: (location_indexes: Array[untyped]) -> HTTP::Response
    def update_location_index(location_indexes:)
      request(:post, "/adsApi/v1/update/locationIndexes", json: { "locationIndexes" => location_indexes }.compact)
    end
  end
end
