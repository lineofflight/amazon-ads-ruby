# frozen_string_literal: true

module AmazonAds
  class CommitmentSpends < API
    # Retrieve commitment spend
    #: (commitment_ids: Array[untyped]) -> HTTP::Response
    def retrieve_commitment_spend(commitment_ids:)
      request(:post, "/adsApi/v1/retrieve/commitmentSpends", json: { "commitmentIds" => commitment_ids }.compact)
    end
  end
end
