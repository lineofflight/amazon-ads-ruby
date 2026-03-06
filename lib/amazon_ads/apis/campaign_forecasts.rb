# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class CampaignForecasts < API
    # Retrieve campaign forecast
    #: (?campaign_forecast_descriptions: Array[untyped]?) -> HTTP::Response
    def dsp_retrieve_campaign_forecast(campaign_forecast_descriptions: nil)
      request(:post, "/adsApi/v1/retrieve/campaignForecasts/dsp", json: { "campaignForecastDescriptions" => campaign_forecast_descriptions }.compact)
    end
  end
end
