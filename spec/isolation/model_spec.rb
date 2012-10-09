require 'rubygems'
require 'spec_helper'

describe Release do
  let(:start_date){Date.strptime("2011-01-01", "%Y-%m-%d")}
  let(:end_date){Date.strptime("2012-08-24", "%Y-%m-%d")}

  it{ Release.releases_in_range(start_date, end_date).count should eql 32 }


end