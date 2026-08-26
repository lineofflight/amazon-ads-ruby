# frozen_string_literal: true

require "test_helper"

class TestRecommendations < Minitest::Test
  include FeatureHelpers

  def test_sb_create_recommendation
    res = @api.sb_create_recommendation(
      recommendations: [{ "recommendationType" => "BRANDED_KEYWORD" }],
    )

    assert_predicate(res.status, :success?)
    refute_empty(res.parse.fetch("success"))
  end
end
