class Show < ActiveRecord::Base
  attr_accessible :city, :date, :info, :link, :venue
  
  validates :date, :venue, :city, :presence => true
end
