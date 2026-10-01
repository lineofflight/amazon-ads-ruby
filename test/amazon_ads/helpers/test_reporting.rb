# frozen_string_literal: true

require "test_helper"
require "zlib"
require "stringio"

class TestReportingHelper < Minitest::Test
  def setup
    @api = AmazonAds::Reporting.new(
      region: "NA",
      access_token: "test_token",
      profile_id: "123456789",
    )
  end

  def test_download_report_with_url
    url = "https://s3.amazonaws.com/test-bucket/report.json"
    content = '{"campaignId":"123","impressions":100}'
    stub_request(:get, url).to_return(status: 200, body: content, headers: { "Content-Type" => "application/json" })

    res = @api.download_report(url)

    assert_predicate(res.status, :success?)
    assert_equal(content, res.body.to_s)
    assert_equal({ "campaignId" => "123", "impressions" => 100 }, res.parse)
  end

  def test_download_report_with_gzipped_url
    url = "https://s3.amazonaws.com/test-bucket/report.json.gz"
    content = '{"campaignId":"123","impressions":100}'

    io = StringIO.new
    gz = Zlib::GzipWriter.new(io)
    gz.write(content)
    gz.close
    gzipped_bytes = io.string

    stub_request(:get, url).to_return(status: 200, body: gzipped_bytes, headers: { "Content-Type" => "application/json" })

    res = @api.download_report(url)

    assert_predicate(res.status, :success?)
    assert_equal(content, res.body.to_s)
    assert_equal({ "campaignId" => "123", "impressions" => 100 }, res.parse)
  end

  def test_download_report_with_report_id
    report_id = "test-report-id"
    download_url = "https://s3.amazonaws.com/test-bucket/report.json"
    content = '{"campaignId":"123","impressions":100}'

    stub_request(:get, "https://advertising-api.amazon.com/reporting/reports/#{report_id}")
      .to_return(status: 200, body: JSON.generate({ "status" => "COMPLETED", "url" => download_url }), headers: { "Content-Type" => "application/json" })

    stub_request(:get, download_url).to_return(status: 200, body: content, headers: { "Content-Type" => "application/json" })

    res = @api.download_report(report_id)

    assert_predicate(res.status, :success?)
    assert_equal(content, res.body.to_s)
  end
end
