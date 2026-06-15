require File.dirname(__FILE__) + "/../spec_helper"

describe Warden::Config do
  before do
    failure_app = lambda { |env| "Failure" }
    config = nil
    Warden::Manager.new(nil, :failure_app => failure_app) do |_config|
      config = _config
    end
    @config = config
  end

  it "responds to an `oauth` message" do
    expect(@config).to respond_to(:oauth)
  end

  describe "#oauth" do
    describe "when initialize" do
      it "requires setting the consumer_key" do
        expect do
          @config.oauth(:service) do |service|
            service.consumer_secret "ABC"
          end
        end.to raise_error(Warden::OAuth::ConfigError, "You need to specify the consumer key and the consumer secret")
      end

      it "requires setting the consumer_secret" do
        expect do
          @config.oauth(:service) do |service|
            service.consumer_key "ABC"
          end
        end.to raise_error(Warden::OAuth::ConfigError, "You need to specify the consumer key and the consumer secret")
      end

      it "creates a new instance of strategy" do
        @config.oauth(:service) do |service|
          service.consumer_key "ABC"
          service.consumer_secret "123"
        end
        expect do
          Warden::OAuth::Strategy::Service
        end.not_to raise_error
      end
    end
  end
end
