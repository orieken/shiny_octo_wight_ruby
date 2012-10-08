require 'sinatra'


set :haml, {:format => :html5 }

get '/' do
  @title = "Releases Survived"
  @current_date = Time.now.strftime('%D')

  haml :index
end