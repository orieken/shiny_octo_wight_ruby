require 'rubygems'
require 'spec_helper'

describe Release do

  describe :release_number do
    it { should accept_values_for(:release_number,  SecureRandom.random_number(10000)) }
    it { should accept_values_for(:release_number, 200) }
    it { should_not accept_values_for(:release_number, nil) }
    it { should_not accept_values_for(:release_number, "a") }
    it { should_not accept_values_for(:release_number, "a" * 201) }
  end


end
