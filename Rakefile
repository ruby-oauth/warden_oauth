require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "warden_oauth"
    gem.summary = %Q{OAuth Strategy generator for Warden Authentication Framework}
    gem.description = %Q{ 
      warden_oauth will help you create oauth authentication strategies using the oauth
      helper method on the Warden::Manager config setup
    }
    gem.email = "romanandreg@gmail.com"
    gem.homepage = "http://github.com/roman/warden_oauth"
    gem.authors = ["Roman Gonzalez"]
    gem.rubyforge_project = "warden_oauth"
    gem.add_dependency('warden', ">= 0.8.1")
    gem.add_dependency('oauth')
    gem.add_development_dependency("rack-test")
    gem.add_development_dependency("fakeweb")
    gem.add_development_dependency("rspec")
    gem.add_development_dependency("yard")
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  root = File.dirname(__FILE__)
  spec.rspec_opts = ['--options', "#{root}/spec/spec.opts"]
  spec.pattern = 'spec/**/*_spec.rb'
end

task :rcov => :spec

task :spec => :check_dependencies if Rake::Task.task_defined?(:check_dependencies)

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
