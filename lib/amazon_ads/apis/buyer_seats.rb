# frozen_string_literal: true

module AmazonAds
  class BuyerSeats < API
    # Create buyer seats for advertisers
    #: (buyer_seats: Array[untyped]) -> HTTP::Response
    def create_buyer_seat(buyer_seats:)
      request(:post, "/adsApi/v1/create/buyerSeats", json: { "buyerSeats" => buyer_seats }.compact)
    end

    # List buyer seats
    # @rbs ad_product: String -- **AdProduct Enum:** | AdProduct | Description | | --- | --- | | `AMAZON_DSP` | Amazon Demand-Side Platform ad product. |
    # @rbs buyer_seat_type: String -- **BuyerSeatType Enum:** | BuyerSeatType | Description | | --- | --- | | `DEAL_CREATION` | The ID for deal providers to identify the buyer seat when creating deals. | | `SPEND_TRACKING` | The ID passed to exchanges to enable buyer recognition within auctions. This can be used for both real-time decision making and offline reporting. |
    #: (?ad_product: String?, ?buyer_seat_type: String?, ?exchange_id: String?, ?next_token: String?, ?max_results: Integer?) -> HTTP::Response
    def list_buyer_seat(ad_product: nil, buyer_seat_type: nil, exchange_id: nil, next_token: nil, max_results: nil)
      request(:get, "/adsApi/v1/buyerSeats", params: { "adProduct" => ad_product, "buyerSeatType" => buyer_seat_type, "exchangeId" => exchange_id, "nextToken" => next_token, "maxResults" => max_results }.compact)
    end
  end
end
