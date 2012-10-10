require_relative 'models/release.rb'
require File.expand_path(File.dirname(__FILE__)) + '/releases_survived'

run Sinatra::Application
