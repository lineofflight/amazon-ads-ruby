# frozen_string_literal: true

module AmazonAds
  class GeoLocations < API
    # Create geo location targeting definitions. Supports smart locations, which target users based on their percentile rank within a Smart Location Index, and radius locations, which target users within a specified distance of an address or coordinate. Note: radius locations are currently in beta.
    #: (geo_locations: Array[untyped]) -> HTTP::Response
    def create_geo_location(geo_locations:)
      request(:post, "/adsApi/v1/create/geoLocations", json: { "geoLocations" => geo_locations }.compact)
    end
  end
end
