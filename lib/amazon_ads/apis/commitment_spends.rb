# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class CommitmentSpends < API
    # Retrieve commitment spend
    #: (?commitment_ids: Array[untyped]?) -> HTTP::Response
    def dsp_retrieve_commitment_spend(commitment_ids: nil)
      request(:post, "/adsApi/v1/retrieve/commitmentSpends/dsp", json: { "commitmentIds" => commitment_ids }.compact)
    end
  end
end
