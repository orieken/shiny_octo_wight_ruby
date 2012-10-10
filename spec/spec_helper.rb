app_file = File.join(File.dirname(__FILE__), *%w[.. releases_survived.rb])
require app_file
require 'capybara/rspec'
require 'rack/test'
require 'active_record'
require 'autotest-fsevent'
require 'autotest-growl'
require 'pry'
require 'pry-nav'
require 'factory_girl'
require File.expand_path(File.dirname(__FILE__)) + '/../models/release.rb'
require_relative 'factories'
require 'accept_values_for'
require 'securerandom'


# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
end

Capybara.app = app

