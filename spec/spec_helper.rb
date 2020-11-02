# frozen_string_literal: true

require 'bundler/setup'
require 'ropenweather'
require 'dotenv'
require 'coveralls'
require 'vcr'
require 'webmock/rspec'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  Dotenv.load
  Coveralls.wear!
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end

  VCR.configure do |c|
    c.define_cassette_placeholder("<API_KEY>", ENV["API_KEY"])
    c.cassette_library_dir = 'spec/cassettes'
    c.configure_rspec_metadata!
    c.hook_into :webmock

    c.default_cassette_options = {
      record: :new_episodes,
      match_requests_on: [
        :method,
        VCR.request_matchers.uri_without_param(:appid),
      ],
    }

    c.before_record do |record|
      record.request.uri.gsub!(ENV['API_KEY'], 'api-key') if ENV.key?('API_KEY')
      record.response.body.force_encoding('UTF-8')
    end
  end
end
