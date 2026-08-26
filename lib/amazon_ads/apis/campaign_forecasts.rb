# frozen_string_literal: true

module AmazonAds
  class CampaignForecasts < API
    # Retrieve campaign forecast
    #: (campaign_forecast_descriptions: Array[untyped]) -> HTTP::Response
    def dsp_retrieve_campaign_forecast(campaign_forecast_descriptions:)
      request(:post, "/adsApi/v1/retrieve/campaignForecasts/dsp", json: { "campaignForecastDescriptions" => campaign_forecast_descriptions }.compact)
    end
  end
end
