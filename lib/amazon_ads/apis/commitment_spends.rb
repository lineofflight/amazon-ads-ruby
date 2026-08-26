# frozen_string_literal: true

module AmazonAds
  class CommitmentSpends < API
    # Retrieve commitment spend (Deprecated legacy ad-product path alias of RetrieveCommitmentSpend; prefer the ad-product-agnostic path.)
    #: (commitment_ids: Array[untyped]) -> HTTP::Response
    def dsp_retrieve_commitment_spend(commitment_ids:)
      request(:post, "/adsApi/v1/retrieve/commitmentSpends/dsp", json: { "commitmentIds" => commitment_ids }.compact)
    end

    # Retrieve commitment spend
    #: (commitment_ids: Array[untyped]) -> HTTP::Response
    def retrieve_commitment_spend(commitment_ids:)
      request(:post, "/adsApi/v1/retrieve/commitmentSpends", json: { "commitmentIds" => commitment_ids }.compact)
    end
  end
end
