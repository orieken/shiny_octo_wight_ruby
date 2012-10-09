require 'sinatra'
require 'active_record'
require 'pry'
require 'pry-nav'
require './config/environments'


set :haml, {:format => :html5}
enable :sessions
set :database, ENV['DATABASE_URL'] ? ENV['DATABASE_URL'] : 'sqlite://releases.db'


get '/' do
  @title = "Releases Survived"
  @current_date = Time.now.strftime('%D')
  haml :index
end

post '/' do
  session[:start_date] = params[:start_date]
  session[:end_date] = params[:end_date]
end

get '/results' do
  start_date = Date.strptime(session[:start_date], "%Y-%m-%d")
  end_date = if session[:end_date] == ""
               Date.today
             else
               Date.strptime(session[:end_date], "%Y-%m-%d")
             end
  @item = Release.releases_in_range(start_date, end_date)
  haml :results, :locals => {:start_date => start_date, :end_date => end_date}
end

#model
class Release < ActiveRecord::Base

  def self.releases_in_range(start_date, end_date)
    #if start_date > Release.first.release_date
    #  return 100
    #end
    omg_all_releases = Release.find(:all, :conditions => {:release_date => (start_date)...(end_date)})
    actual_count = 0
    omg_all_releases.each do |count_release_correctly|
      actual_count += 1
      p actual_count
      count_release_correctly.id
    end
    actual_count
  end
end