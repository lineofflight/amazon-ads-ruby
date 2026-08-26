# frozen_string_literal: true

require "test_helper"

class TestCommitments < Minitest::Test
  include FeatureHelpers

  def test_list_commitment
    res = @api.list_commitment

    assert_predicate(res.status, :success?)
  end
end
