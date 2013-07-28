class Show < ActiveRecord::Base
  attr_accessible :city, :date, :info, :tickets_link, :venue, :venue_link
  
  validates :date, :venue, :city, :presence => true
  validates :venue_link, :tickets_link, :format => {
    :with => /^http/,
    :message => "Need the full URL, with http at the beginning"
  }, :allow_blank => true
end
