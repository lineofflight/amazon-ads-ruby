# frozen_string_literal: true

module AmazonAds
  class DealPerformances < API
    # Retrieve performance metrics for each specified deal.
    # @rbs ad_product: String -- **AdProduct Enum:** | AdProduct | Description | | --- | --- | | `AMAZON_DSP` | Amazon Demand-Side Platform ad product. |
    #: (advertising_deal_id: String, ?ad_product: String?, ?performance_end_date: String?, ?performance_start_date: String?, ?next_token: String?, ?max_results: Integer?) -> HTTP::Response
    def list_deal_performance(advertising_deal_id:, ad_product: nil, performance_end_date: nil, performance_start_date: nil, next_token: nil, max_results: nil)
      request(:get, "/adsApi/v1/dealPerformances", params: { "adProduct" => ad_product, "advertisingDealId" => advertising_deal_id, "performanceEndDate" => performance_end_date, "performanceStartDate" => performance_start_date, "nextToken" => next_token, "maxResults" => max_results }.compact)
    end
  end
end
