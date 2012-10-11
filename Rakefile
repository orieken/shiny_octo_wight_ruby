require File.join(File.expand_path(File.dirname(__FILE__)), 'releases_survived')
require 'rubygems'
require 'bundler/setup'
require './config/environments'
require './models/release.rb'
require 'active_record'
require 'sinatra/activerecord/rake'
require 'csv'
require 'pry'
require 'pry-nav'


task :default => [:'db:migrate', :features]

#rake csv_model_import[csv_fle.csv]


desc "Import CSV to table"
task :csv_import, :filename do |t, args|
  CSV.foreach(args[:filename], :headers => true, :header_converters => :symbol) do |row|
    begin
      Release.create!(row.to_hash)
    rescue ActiveRecord::RecordNotSaved # in current Rails
                                        # handle save failures here…
    end
  end
end

desc "I didn't know a better way to do this"
task :convert_string_to_date do |t|
  all = Release.all
  all.each do |s|
    s.release_date = Date.strptime s.release_date, '%m/%d/%Y'
    s.save
  end
end