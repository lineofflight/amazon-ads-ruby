# frozen_string_literal: true

require "test_helper"
require "socket"

class TestFlushedRaiseError < Minitest::Test
  BODY = '{"message":"BAD_REQUEST: adProductFilter must be an object"}'

  def setup
    # test_helper hooks VCR into WebMock for every test, which intercepts
    # HTTP::Client#perform before it ever opens a socket. This test exists
    # specifically to exercise that real socket path, so bypass both for
    # its duration.
    VCR.turn_off!
    WebMock.allow_net_connect!

    @server = TCPServer.new("127.0.0.1", 0)
    @port = @server.addr[1]
    @thread = Thread.new do
      socket = @server.accept
      socket.readpartial(4096)
      socket.write(
        "HTTP/1.1 400 Bad Request\r\n" \
          "Content-Type: application/json\r\n" \
          "Content-Length: #{BODY.bytesize}\r\n" \
          "Connection: close\r\n" \
          "\r\n#{BODY}",
      )
      socket.close
    end
  end

  def teardown
    @thread.kill
    @server.close

    WebMock.disable_net_connect!
    VCR.turn_on!
  end

  def test_status_error_retains_body
    error = assert_raises(HTTP::StatusError) do
      HTTP.use(:flushed_raise_error).get("http://127.0.0.1:#{@port}/")
    end

    assert_equal(BODY, error.response.body.to_s)
  end

  def test_ignored_codes_pass_through
    response = HTTP.use(flushed_raise_error: { ignore: [400] }).get("http://127.0.0.1:#{@port}/")

    assert_equal(400, response.status.code)
  end
end
