# frozen_string_literal: true

require "test_helper"
require "generator/specs"
require "generator/errors"

class TestGeneratorErrors < Minitest::Test
  SPEC = {
    "components" => {
      "schemas" => {
        "ErrorCode" => {
          "type" => "string",
          "enum" => ["NOT_FOUND", "TOO_MANY_REQUESTS"],
          "description" => "**ErrorCode Enum:**\n\n" \
            "| ErrorCode | Description |\n" \
            "|------|------|\n" \
            "| `NOT_FOUND` | The requested resource does not exist. |\n",
        },
      },
    },
  }.freeze

  def setup
    @source = Generator::Errors.new(spec: SPEC).generate
  end

  def test_generates_class_with_description
    assert_includes(@source, <<~RUBY.gsub(/^(?=.)/, "    "))
      # The requested resource does not exist.
      class NotFound < Error; end
    RUBY
  end

  def test_generates_class_without_description
    assert_includes(@source, "\n\n    class TooManyRequests < Error; end\n")
  end

  def test_maps_codes_to_classes
    assert_includes(@source, <<~RUBY.gsub(/^(?=.)/, "      "))
      "NOT_FOUND" => NotFound,
      "TOO_MANY_REQUESTS" => TooManyRequests,
    RUBY
  end

  def test_checked_in_errors_match_spec
    assert_equal(Generator::Errors.new.generate, File.read(Generator::Errors::OUTPUT_PATH))
  end
end
