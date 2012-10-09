require 'rubygems'
require 'spec_helper'

describe "Capybara examples" do

  before(:each) do
    visit "/"
  end

  it { page.should have_content(Time.now.strftime('%D')) }
  it { page.should have_selector('form') }
  it { page.should have_selector('h1') }
  it { page.should have_selector('input#start_date') }
  it { page.should have_selector('input#end_date') }
  it { page.should have_button('Submit') }


end
