$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'warden_oauth'
require 'rspec'
File.singleton_class.alias_method(:exists?, :exist?) unless File.respond_to?(:exists?)
require 'fakeweb'
require 'rack/session/cookie'

require File.dirname(__FILE__) + "/application_scenario"

RSpec.configure do |config|
  config.expect_with(:rspec) { |expectations| expectations.syntax = [:expect, :should] }
  config.expect_with(:rspec) { |expectations| expectations.on_potential_false_positives = :nothing }

  config.before(:all) do
    FakeWeb.allow_net_connect = false
  end
end
