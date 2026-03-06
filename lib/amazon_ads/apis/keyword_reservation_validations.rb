# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class KeywordReservationValidations < API
    # Validate keyword reservation
    #: (?keyword_reservation_validations: Array[untyped]?) -> HTTP::Response
    def sb_create_keyword_reservation_validation(keyword_reservation_validations: nil)
      request(:post, "/adsApi/v1/create/keywordReservationValidations/sb", json: { "keywordReservationValidations" => keyword_reservation_validations }.compact)
    end
  end
end
