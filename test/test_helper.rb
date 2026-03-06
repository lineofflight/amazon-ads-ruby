# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

require "dotenv"

Dotenv.load("#{__dir__}/.env", "#{__dir__}/.env.example")

require "minitest/autorun"
require "amazon_ads"

require_relative "support/recordable"
require_relative "support/feature_helpers"
