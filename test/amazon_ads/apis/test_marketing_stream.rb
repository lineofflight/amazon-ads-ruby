# frozen_string_literal: true

require "test_helper"

class TestMarketingStream < Minitest::Test
  include FeatureHelpers

  def test_list_stream_subscriptions
    res = @api.list_stream_subscriptions

    assert_predicate(res.status, :success?)
  end
end
