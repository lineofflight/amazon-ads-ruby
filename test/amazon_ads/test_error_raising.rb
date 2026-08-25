# frozen_string_literal: true

require "test_helper"
require "socket"

# Error raising must survive real connection teardown, which WebMock cannot
# simulate, so these tests run against a local TCP server.
class TestErrorRaising < Minitest::Test
  ERROR_BODY = '{"message":"Invalid filter"}'

  class LocalAPI < AmazonAds::API
    attr_accessor :port

    def endpoint
      URI::HTTP.build(host: "127.0.0.1", port: port)
    end
  end

  def setup
    super
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  def teardown
    WebMock.disable_net_connect!
    super
  end

  def test_error_response_body_survives
    port = serve(status: 400, body: ERROR_BODY)
    api = build_api(port)

    error = assert_raises(AmazonAds::Error) do
      api.send(:request, :get, "/test")
    end

    assert_equal(400, error.status)
    assert_equal(ERROR_BODY, error.response.body.to_s)
  end

  def test_success_passes_through
    port = serve(status: 200, body: '{"ok":true}')
    api = build_api(port)

    response = api.send(:request, :get, "/test")

    assert_equal(200, response.code)
  end

  def test_exhausted_retries_raise_error_with_last_response
    port = serve(status: 429, body: '{"message":"Throttled"}', requests: 2)
    api = build_api(port, retries: 1)

    error = assert_raises(AmazonAds::Error) do
      api.send(:request, :get, "/test")
    end

    assert_equal(429, error.status)
    assert_equal('{"message":"Throttled"}', error.response.body.to_s)
  end

  def test_lwa_error_raises_with_body
    stub_request(:post, AmazonAds::LWA::URL)
      .to_return(status: 400, body: '{"error":"invalid_grant"}')

    error = assert_raises(AmazonAds::Error) do
      AmazonAds::LWA.request(refresh_token: "bogus")
    end

    assert_equal(400, error.status)
    assert_equal('{"error":"invalid_grant"}', error.response.body.to_s)
  end

  private

  def build_api(port, retries: 0)
    api = LocalAPI.new(region: :na, access_token: "token", retries: retries)
    api.port = port
    api
  end

  def serve(status:, body:, requests: 1)
    server = TCPServer.new("127.0.0.1", 0)
    port = server.addr[1]

    Thread.new do
      requests.times do
        socket = server.accept
        begin
          socket.readpartial(4096)
        rescue EOFError
          nil
        end
        socket.write(
          "HTTP/1.1 #{status} X\r\n" \
            "Content-Type: application/json\r\n" \
            "Content-Length: #{body.bytesize}\r\n" \
            "Connection: close\r\n\r\n#{body}",
        )
        socket.close
      end
      server.close
    end

    port
  end
end
