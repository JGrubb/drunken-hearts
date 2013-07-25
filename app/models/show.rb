class Show < ActiveRecord::Base
  attr_accessible :city, :date, :info, :tickets_link, :venue, :venue_link
  
  validates :date, :venue, :city, :presence => true
end
