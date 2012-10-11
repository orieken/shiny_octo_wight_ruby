
class Release < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessor :release_number, :release_date
  validates_presence_of :release_number, :release_date
  validates_numericality_of :release_number


  def self.releases_in_range(start_date, end_date)
    Release.find(:all, :conditions => {:release_date => (start_date)...(end_date)})
  end
end
