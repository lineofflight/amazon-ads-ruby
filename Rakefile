# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "rubocop/rake_task"

RuboCop::RakeTask.new

desc "Check types with Steep"
task :steep do
  sh "steep check"
end

desc "Download OpenAPI specs from Amazon Ads"
task :download do
  require_relative "lib/generator/specs"
  Generator::Specs.download_all
end

desc "Generate API classes from OpenAPI specs"
task :generate do
  require_relative "lib/generator/specs"
  require_relative "lib/generator/api"

  # v1 merged spec: generate one class per tag
  Generator::API.generate_by_tags("amazon_ads")

  # REST specs: generate one class each
  ["profiles", "reporting", "marketing_stream", "portfolios"].each do |name|
    Generator::API.new(name).save
  end
end

task default: [:rubocop, :steep, :test]
