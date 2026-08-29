# frozen_string_literal: true

module AmazonAds
  # Portfolios
  class Portfolios < API
    # @rbs portfolios: Array[untyped] -- An array of portfolio to create.
    #: (portfolios: Array[untyped]) -> HTTP::Response
    def create_portfolios(portfolios:)
      request(:post, "/portfolios", json: { "portfolios" => portfolios }.compact, headers: { "Content-Type" => "application/vnd.spPortfolio.v3+json", "Accept" => "application/vnd.spPortfolio.v3+json" })
    end

    # @rbs include_extended_data_fields: bool -- whether to get a list of targetingClauses with extended data fields (creationDate, lastUpdateDate, servingStatus).
    # @rbs next_token: String -- token value allowing to navigate to the next response page
    #: (?include_extended_data_fields: bool?, ?name_filter: untyped?, ?next_token: String?, ?portfolio_id_filter: untyped?, ?state_filter: untyped?) -> HTTP::Response
    def list_portfolios(include_extended_data_fields: nil, name_filter: nil, next_token: nil, portfolio_id_filter: nil, state_filter: nil)
      request(:post, "/portfolios/list", json: { "includeExtendedDataFields" => include_extended_data_fields, "nameFilter" => name_filter, "nextToken" => next_token, "portfolioIdFilter" => portfolio_id_filter, "stateFilter" => state_filter }.compact, headers: { "Content-Type" => "application/vnd.spPortfolio.v3+json", "Accept" => "application/vnd.spPortfolio.v3+json" })
    end

    # Budget usage API for portfolios
    # @rbs portfolio_ids: Array[untyped] -- A list of portfolio IDs.
    #: (?portfolio_ids: Array[untyped]?) -> HTTP::Response
    def portfolio_budget_usage(portfolio_ids: nil)
      request(:post, "/portfolios/budget/usage", json: { "portfolioIds" => portfolio_ids }.compact, headers: { "Content-Type" => "application/vnd.portfoliobudgetusage.v1+json", "Accept" => "application/vnd.portfoliobudgetusage.v1+json" })
    end

    # @rbs portfolios: Array[untyped] -- An array of portfolio with updated values.
    #: (portfolios: Array[untyped]) -> HTTP::Response
    def update_portfolios(portfolios:)
      request(:put, "/portfolios", json: { "portfolios" => portfolios }.compact, headers: { "Content-Type" => "application/vnd.spPortfolio.v3+json", "Accept" => "application/vnd.spPortfolio.v3+json" })
    end
  end
end
