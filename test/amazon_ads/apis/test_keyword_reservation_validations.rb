# frozen_string_literal: true

require "test_helper"

class TestKeywordReservationValidations < Minitest::Test
  include FeatureHelpers

  def test_sb_create_keyword_reservation_validation
    res = @api.sb_create_keyword_reservation_validation(
      keyword_reservation_validations: [{ "keyword" => "acme" }],
    )

    assert_predicate(res.status, :success?)
    refute_empty(res.parse.fetch("success"))
  end
end
