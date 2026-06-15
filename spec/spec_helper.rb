# frozen_string_literal: true

# Config for development dependencies of this library
# i.e., not configured by this library
#
# SimpleCov & related config (must run BEFORE any other requires)
# NOTE: Gemfiles for non-coverage appraisals may not have kettle-soup-cover.
#       The rescue LoadError handles that scenario.
begin
  require "kettle-soup-cover"
  require "simplecov" if Kettle::Soup::Cover::DO_COV # `.simplecov` is run here!
rescue LoadError => error
  # check the error message and re-raise when unexpected
  raise error unless error.message.include?("kettle")
end

# External RSpec & related config
require "kettle/test/rspec"

require "fakeweb"
require "rack/session/cookie"
require "warden_oauth"

class << File
  alias_method :exists?, :exist? unless respond_to?(:exists?)
end

require File.dirname(__FILE__) + "/application_scenario"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.expose_dsl_globally = true if config.respond_to?(:expose_dsl_globally=)

  config.expect_with :rspec do |c|
    c.syntax = [:expect, :should]
  end
  config.before(:all) do
    FakeWeb.allow_net_connect = false
  end
end

RSpec::Expectations.configuration.syntax = [:expect, :should]
