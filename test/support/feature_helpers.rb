# frozen_string_literal: true

require_relative "credentials"
require_relative "recordable"

module FeatureHelpers
  include Credentials
  include Recordable

  def setup
    super

    class_name = self.class.name.delete_prefix("Test")
    @api = AmazonAds.const_get(class_name).new(region:, profile_id:, access_token:)
  end

  def access_token
    data = AmazonAds::LWA.request(refresh_token:)
    data.fetch("access_token")
  end
end
