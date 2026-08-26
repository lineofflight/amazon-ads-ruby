# frozen_string_literal: true

require "test_helper"

class TestBrandedKeywordsPricings < Minitest::Test
  include FeatureHelpers

  def test_sb_create_branded_keywords_pricing
    # Requires at least 5 unique keywords
    res = @api.sb_create_branded_keywords_pricing(
      branded_keywords_pricings: [{
        "keywords" => ["acme", "acme shoes", "acme boots", "acme sandals", "acme slippers"],
        "startDateTime" => (Time.now + (7 * 86_400)).utc.iso8601,
        "endDateTime" => (Time.now + (37 * 86_400)).utc.iso8601,
      }],
    )

    assert_predicate(res.status, :success?)
    refute_empty(res.parse.fetch("success"))
  end
end
