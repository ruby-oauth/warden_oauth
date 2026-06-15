require File.dirname(__FILE__) + "/../spec_helper"
require "rack/test"

describe Warden::OAuth::Strategy do
  def fixture_response(name)
    File.dirname(__FILE__) + "/../fixtures/%s.txt" % name
  end

  describe ".build" do
    before do
      @config = Warden::OAuth::Config.new
      @config.consumer_key "ABC"
      @config.consumer_secret "123"
      @config.options :site => "http://service.com"
      Warden::OAuth::Strategy.send(:remove_const, "Service") if Warden::OAuth::Strategy.const_defined?("Service")
      Warden::Strategies.clear!
      Warden::OAuth::Strategy.build(:service, @config)
    end

    it "creates a new instance that extends from Warden::OAuth::Strategy" do
      expect(Warden::OAuth::Strategy.const_defined?("Service")).to be true
      expect(Warden::OAuth::Strategy::Service < Warden::OAuth::Strategy).to be true
    end

    it "registers the oauth service key on the Warden strategies with `_oauth` appended" do
      expect(Warden::Strategies[:service_oauth]).not_to be_nil
      expect(Warden::OAuth::Strategy::Service).not_to be_nil
      expect(Warden::Strategies[:service_oauth]).to eq(Warden::OAuth::Strategy::Service)
    end

    it "assigns the oauth_service config as a constant" do
      expect(Warden::OAuth::Strategy::Service::CONFIG).not_to be_nil
      expect(Warden::OAuth::Strategy::Service::CONFIG).to eq(@config)
    end
  end

  describe "when invoking the strategy" do
    before do
      @request = Rack::MockRequest.new($app)
    end

    describe "without warden_oauth_service nor oauth_token parameter" do
      before do
        @response = @request.get("/")
      end

      it "renders the failure app response" do
        expect(@response.body).to eq("You are not authenticated")
      end
    end

    describe "with a warden_oauth_provider parameter" do
      before do
        FakeWeb.register_uri(:post, "http://localhost:3000/oauth/request_token",
          :body => fixture_response("unauthorized_request_token"))
        @response = @request.get("/", :params => {"warden_oauth_provider" => "example"})
      end

      it "redirects to the authorize url" do
        expect(@response.headers["Location"]).to include("http://localhost:3000/oauth/authorize")
      end
    end

    describe "when receiving a valid oauth response" do
      include Rack::Test::Methods

      def app
        $app
      end

      before do
        Warden::Strategies.clear!
        Warden::OAuth::Strategy.send(:remove_const, "Example") if Warden::OAuth::Strategy.const_defined?("Example")
      end

      describe "and the access_token_user_finder hasn't been declared" do
        before do
          FakeWeb.register_uri(:post, "http://localhost:3000/oauth/request_token",
            :body => fixture_response("unauthorized_request_token"))
        end

        it "raises an exception saying that the access_token_finder is not declared" do
          get "/", "warden_oauth_provider" => "example"
          FakeWeb.register_uri(:post, "http://localhost:3000/oauth/access_token",
            :body => "oauth_token=ABC&oauth_token_secret=123")
          expect do
            get "/", "oauth_token" => "SylltB94pocC6hex8kr9",
              "oauth_verifier" => "omPxEkKnnx9ygnu7dd6f"
          end.to raise_error(RuntimeError, /strategy/)
        end
      end

      describe "and the access_token_user_finder has been declared" do
        before do
          Warden::OAuth.access_token_user_finder(:example) do |access_token|
            Object.new if access_token.token == "ABC" && access_token.secret == "123"
          end
          FakeWeb.register_uri(:post, "http://localhost:3000/oauth/request_token",
            :body => fixture_response("unauthorized_request_token"))
          get "/", "warden_oauth_provider" => "example"
        end

        after do
          Warden::OAuth.clear_access_token_user_finders
        end

        describe "and the user is not found" do
          before do
            FakeWeb.register_uri(:post, "http://localhost:3000/oauth/access_token",
              :body => "oauth_token=ABD&oauth_token_secret=122")
            get "/", "oauth_token" => "SylltB94pocC6hex8kr9",
              "oauth_verifier" => "omPxEkKnnx9ygnu7dd6f"
          end

          it "invokes the fail app" do
            expect(last_response.body).to eq("No user with the given access token")
          end
        end

        describe "and the user is found" do
          before do
            FakeWeb.register_uri(:post, "http://localhost:3000/oauth/access_token",
              :body => "oauth_token=ABC&oauth_token_secret=123")
            get "/", "oauth_token" => "SylltB94pocC6hex8kr9",
              "oauth_verifier" => "omPxEkKnnx9ygnu7dd6f"
          end

          it "goes to the desired app" do
            expect(last_response.body).to eq("Welcome")
          end
        end
      end
    end
  end
end
