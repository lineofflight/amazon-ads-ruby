# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  class AdAssociations < API
    # Create Ad Association
    #: (?ad_associations: Array[untyped]?) -> HTTP::Response
    def create_ad_association(ad_associations: nil)
      request(:post, "/adsApi/v1/create/adAssociations", json: { "adAssociations" => ad_associations }.compact)
    end

    # Delete Ad Association
    #: (?ad_association_ids: Array[untyped]?) -> HTTP::Response
    def delete_ad_association(ad_association_ids: nil)
      request(:post, "/adsApi/v1/delete/adAssociations", json: { "adAssociationIds" => ad_association_ids }.compact)
    end

    # Query Ad Association
    #: (?ad_association_id_filter: String?, ?ad_group_id_filter: String?, ?ad_id_filter: String?, ?max_results: Integer?, ?next_token: String?) -> HTTP::Response
    def query_ad_association(ad_association_id_filter: nil, ad_group_id_filter: nil, ad_id_filter: nil, max_results: nil, next_token: nil)
      request(:post, "/adsApi/v1/query/adAssociations", json: { "adAssociationIdFilter" => ad_association_id_filter, "adGroupIdFilter" => ad_group_id_filter, "adIdFilter" => ad_id_filter, "maxResults" => max_results, "nextToken" => next_token }.compact)
    end

    # Update Ad Association
    #: (?ad_associations: Array[untyped]?) -> HTTP::Response
    def update_ad_association(ad_associations: nil)
      request(:post, "/adsApi/v1/update/adAssociations", json: { "adAssociations" => ad_associations }.compact)
    end
  end
end
