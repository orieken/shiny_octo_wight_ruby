require 'rubygems'
require 'spec_helper'
require 'autotest-fsevent'
require 'autotest-growl'

describe Sinatra::Application do

  before(:each) do
    get '/'
  end

  it { last_response.should be_ok }
  it { last_response.body.should include(Time.now.strftime('%D')) }

  it { response.should have_tag('h1') }

end