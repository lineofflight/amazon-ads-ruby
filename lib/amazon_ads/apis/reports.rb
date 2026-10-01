# frozen_string_literal: true

module AmazonAds
  class Reports < API
    # Create a report
    #: (access_requested_accounts: Array[untyped], reports: Array[untyped]) -> HTTP::Response
    def ads_apiv1_create_report(access_requested_accounts:, reports:)
      request(:post, "/adsApi/v1/create/reports", json: { "accessRequestedAccounts" => access_requested_accounts, "reports" => reports }.compact)
    end

    # Delete a report by ID
    #: (report_ids: Array[untyped]) -> HTTP::Response
    def ads_apiv1_delete_report(report_ids:)
      request(:post, "/adsApi/v1/delete/reports", json: { "reportIds" => report_ids }.compact)
    end

    # Retrieve a report by ID
    #: (report_ids: Array[untyped]) -> HTTP::Response
    def ads_apiv1_retrieve_report(report_ids:)
      request(:post, "/adsApi/v1/retrieve/reports", json: { "reportIds" => report_ids }.compact)
    end
  end
end
