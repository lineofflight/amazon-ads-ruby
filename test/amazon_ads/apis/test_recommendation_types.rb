# frozen_string_literal: true

require "test_helper"

class TestRecommendationTypes < Minitest::Test
  include FeatureHelpers

  def test_sb_query_recommendation_type
    res = @api.sb_query_recommendation_type

    assert_predicate(res.status, :success?)
  end
end
