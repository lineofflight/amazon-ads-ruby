# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class Commitments < API
    # Create commitments
    #: (?commitments: Array[untyped]?) -> HTTP::Response
    def dsp_create_commitment(commitments: nil)
      request(:post, "/adsApi/v1/create/commitments/dsp", json: { "commitments" => commitments }.compact)
    end

    # List commitments
    #: (?next_token: String?, ?max_results: Integer?) -> HTTP::Response
    def dsp_list_commitment(next_token: nil, max_results: nil)
      request(:get, "/adsApi/v1/commitments/dsp", params: { "nextToken" => next_token, "maxResults" => max_results }.compact)
    end

    # Get Commitments
    #: (?commitment_ids: Array[untyped]?) -> HTTP::Response
    def dsp_retrieve_commitment(commitment_ids: nil)
      request(:post, "/adsApi/v1/retrieve/commitments/dsp", json: { "commitmentIds" => commitment_ids }.compact)
    end

    # Update commitments
    #: (?commitments: Array[untyped]?) -> HTTP::Response
    def dsp_update_commitment(commitments: nil)
      request(:post, "/adsApi/v1/update/commitments/dsp", json: { "commitments" => commitments }.compact)
    end
  end
end
