# frozen_string_literal: true
# rbs_inline: enabled

module AmazonAds
  # Offline Report
  class Reporting < API
    # Creates a report request
    # @rbs end_date: String -- YYYY-MM-DD format. The maximum lookback window supported depends on the selection of reportTypeId. Most report types support `95 days` as lookback window.
    # @rbs name: String -- The name of the report.
    # @rbs start_date: String -- YYYY-MM-DD format. The maximum lookback window supported depends on the selection of reportTypeId. Most report types support `95 days` as lookback window.
    #: (configuration: untyped, end_date: String, start_date: String, ?name: String?) -> HTTP::Response
    def create_async_report(configuration:, end_date:, start_date:, name: nil)
      request(:post, "/reporting/reports", json: { "configuration" => configuration, "endDate" => end_date, "name" => name, "startDate" => start_date }.compact, headers: { "Content-Type" => "application/vnd.createasyncreportrequest.v3+json" })
    end

    # Deletes a report by id
    # @rbs report_id: String -- The identifier of the requested report.
    #: (String) -> HTTP::Response
    def delete_async_report(report_id)
      request(:delete, "/reporting/reports/#{report_id}")
    end

    # Gets a generation status of report by id
    # @rbs report_id: String -- The identifier of the requested report.
    #: (String) -> HTTP::Response
    def get_async_report(report_id)
      request(:get, "/reporting/reports/#{report_id}")
    end
  end
end
