require 'rubygems'
require 'spec_helper'

describe "Capybara examples" do

  before(:each) do
    visit "/"
  end

  it { page.should have_content(Time.now.strftime('%D')) }
  it { page.should have_selector('h1') }
end