require 'sinatra'
require 'active_record'
require 'haml'
require 'sass'
require 'pry'
require 'pry-nav'
require './config/environments'

set :haml, {:format => :html5}
enable :sessions


get '/' do
  @title = "Releases Survived"
  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
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
  @item = Release.releases_in_range(start_date, end_date).count
  haml :results, :locals => {:start_date => start_date, :end_date => end_date}
end
