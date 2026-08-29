# frozen_string_literal: true

require "test_helper"

class TestPortfolios < Minitest::Test
  include FeatureHelpers

  def test_list_portfolios
    res = @api.list_portfolios(include_extended_data_fields: true)

    assert_predicate(res.status, :success?)
  end
end
