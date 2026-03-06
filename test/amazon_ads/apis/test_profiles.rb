# frozen_string_literal: true

require "test_helper"

class TestProfiles < Minitest::Test
  include FeatureHelpers

  def test_list_profiles
    res = @api.list_profiles

    assert_predicate(res.status, :success?)
  end
end
