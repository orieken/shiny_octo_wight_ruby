app_file = File.join(File.dirname(__FILE__), *%w[.. releases_survived.rb])
require app_file
require 'capybara/rspec'
require 'rack/test'
require 'active_record'
require 'pry'
require 'pry-nav'

# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end