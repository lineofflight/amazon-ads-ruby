# frozen_string_literal: true

module Credentials
  def region
    ENV.fetch("AMAZON_ADS_TEST_REGION")
  end

  def profile_id
    ENV.fetch("AMAZON_ADS_TEST_PROFILE_ID")
  end

  def refresh_token
    ENV.fetch("AMAZON_ADS_TEST_REFRESH_TOKEN")
  end
end
