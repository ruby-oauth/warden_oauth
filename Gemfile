source "https://rubygems.org"

#### IMPORTANT #######################################################
# Gemfile is for local development ONLY; Gemfile is NOT loaded in CI #
####################################################### IMPORTANT ####

gemspec

gem "rake"
gem "rack-session"
gem "oauth", path: "../oauth"

unless %w[false 0 no off].include?(ENV.fetch("RUBY_OAUTH_DEV", "false").downcase)
  begin
    require "nomono/bundler" unless defined?(Nomono)
  rescue LoadError
    require_relative "../nomono/lib/nomono/bundler"
  end

  eval_nomono_gems(
    gems: %w[auth-sanitizer],
    prefix: "RUBY_OAUTH",
    path_env: "RUBY_OAUTH_DEV",
    root: %w[code src ruby-oauth],
    debug_env: "RUBY_OAUTH_DEBUG",
  )
end
