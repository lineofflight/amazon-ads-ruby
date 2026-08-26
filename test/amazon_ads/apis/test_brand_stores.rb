# frozen_string_literal: true

require "test_helper"

class TestBrandStores < Minitest::Test
  include FeatureHelpers

  def test_query_brand_store
    res = @api.query_brand_store(store_name_filter: { "include" => ["Acme"] })

    assert_predicate(res.status, :success?)
  end
end
