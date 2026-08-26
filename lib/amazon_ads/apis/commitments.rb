# frozen_string_literal: true

module AmazonAds
  class Commitments < API
    # Create commitments
    #: (commitments: Array[untyped]) -> HTTP::Response
    def create_commitment(commitments:)
      request(:post, "/adsApi/v1/create/commitments", json: { "commitments" => commitments }.compact)
    end

    # Create commitments (Deprecated legacy ad-product path alias of CreateCommitment; prefer the ad-product-agnostic path.)
    #: (commitments: Array[untyped]) -> HTTP::Response
    def dsp_create_commitment(commitments:)
      request(:post, "/adsApi/v1/create/commitments/dsp", json: { "commitments" => commitments }.compact)
    end

    # List commitments (Deprecated legacy ad-product path alias of ListCommitment; prefer the ad-product-agnostic path.)
    #: (?next_token: String?, ?max_results: Integer?) -> HTTP::Response
    def dsp_list_commitment(next_token: nil, max_results: nil)
      request(:get, "/adsApi/v1/commitments/dsp", params: { "nextToken" => next_token, "maxResults" => max_results }.compact)
    end

    # Query commitments with filters (Deprecated legacy ad-product path alias of QueryCommitment; prefer the ad-product-agnostic path.)
    #: (?advertiser_ids_filter: untyped?, ?campaign_ids_filter: untyped?, ?commitment_id_filter: untyped?, ?commitment_name_filter: untyped?, ?deal_ids_filter: untyped?, ?max_results: Integer?, ?next_token: String?, ?spend_calculation_mode_filter: untyped?) -> HTTP::Response
    def dsp_query_commitment(advertiser_ids_filter: nil, campaign_ids_filter: nil, commitment_id_filter: nil, commitment_name_filter: nil, deal_ids_filter: nil, max_results: nil, next_token: nil, spend_calculation_mode_filter: nil)
      request(:post, "/adsApi/v1/query/commitments/dsp", json: { "advertiserIdsFilter" => advertiser_ids_filter, "campaignIdsFilter" => campaign_ids_filter, "commitmentIdFilter" => commitment_id_filter, "commitmentNameFilter" => commitment_name_filter, "dealIdsFilter" => deal_ids_filter, "maxResults" => max_results, "nextToken" => next_token, "spendCalculationModeFilter" => spend_calculation_mode_filter }.compact)
    end

    # Get Commitments (Deprecated legacy ad-product path alias of RetrieveCommitment; prefer the ad-product-agnostic path.)
    #: (commitment_ids: Array[untyped]) -> HTTP::Response
    def dsp_retrieve_commitment(commitment_ids:)
      request(:post, "/adsApi/v1/retrieve/commitments/dsp", json: { "commitmentIds" => commitment_ids }.compact)
    end

    # Update commitments (Deprecated legacy ad-product path alias of UpdateCommitment; prefer the ad-product-agnostic path.)
    #: (commitments: Array[untyped]) -> HTTP::Response
    def dsp_update_commitment(commitments:)
      request(:post, "/adsApi/v1/update/commitments/dsp", json: { "commitments" => commitments }.compact)
    end

    # List commitments
    #: (?next_token: String?, ?max_results: Integer?) -> HTTP::Response
    def list_commitment(next_token: nil, max_results: nil)
      request(:get, "/adsApi/v1/commitments", params: { "nextToken" => next_token, "maxResults" => max_results }.compact)
    end

    # Query commitments with filters
    #: (?advertiser_ids_filter: untyped?, ?campaign_ids_filter: untyped?, ?commitment_id_filter: untyped?, ?commitment_name_filter: untyped?, ?deal_ids_filter: untyped?, ?max_results: Integer?, ?next_token: String?, ?spend_calculation_mode_filter: untyped?) -> HTTP::Response
    def query_commitment(advertiser_ids_filter: nil, campaign_ids_filter: nil, commitment_id_filter: nil, commitment_name_filter: nil, deal_ids_filter: nil, max_results: nil, next_token: nil, spend_calculation_mode_filter: nil)
      request(:post, "/adsApi/v1/query/commitments", json: { "advertiserIdsFilter" => advertiser_ids_filter, "campaignIdsFilter" => campaign_ids_filter, "commitmentIdFilter" => commitment_id_filter, "commitmentNameFilter" => commitment_name_filter, "dealIdsFilter" => deal_ids_filter, "maxResults" => max_results, "nextToken" => next_token, "spendCalculationModeFilter" => spend_calculation_mode_filter }.compact)
    end

    # Get Commitments
    #: (commitment_ids: Array[untyped]) -> HTTP::Response
    def retrieve_commitment(commitment_ids:)
      request(:post, "/adsApi/v1/retrieve/commitments", json: { "commitmentIds" => commitment_ids }.compact)
    end

    # Update commitments
    #: (commitments: Array[untyped]) -> HTTP::Response
    def update_commitment(commitments:)
      request(:post, "/adsApi/v1/update/commitments", json: { "commitments" => commitments }.compact)
    end
  end
end
