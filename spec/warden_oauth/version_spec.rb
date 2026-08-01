# frozen_string_literal: true

require "anonymous_loader"
RSpec.describe Warden::OAuth::Version do
  it "executes the version file for coverage without redefining constants" do
    path = File.expand_path("../../lib/warden_oauth/version.rb", __dir__)
    anonymous_namespace = AnonymousLoader.load(:files => path)

    expect(anonymous_namespace::Warden::OAuth::Version::VERSION).to eq(described_class::VERSION)
  end
end
