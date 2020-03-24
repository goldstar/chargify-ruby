require "rubygems"
require "base64"
require "bundler/setup"
require "dotenv"
require "vcr"

Dotenv.load
Bundler.require(:default, :development)

require "chargify"

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
  config.order = :random
end

Chargify[:api].configure do |config|
  config.api_key = ENV["CHARGIFY_API_KEY"]
  config.subdomain = ENV["CHARGIFY_SUBDOMAIN"]
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :faraday, :webmock
  c.configure_rspec_metadata!

  c.filter_sensitive_data("<CHARGIFY_API_KEY>") {
    Base64.strict_encode64(ENV.fetch("CHARGIFY_API_KEY", "chargify-api-key") + ":X")
  }
  c.filter_sensitive_data("<CHARGIFY_SUBDOMAIN>") {
    ENV.fetch("CHARGIFY_SUBDOMAIN", "chargify-subdomain")
  }
end
