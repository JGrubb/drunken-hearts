class Show < ActiveRecord::Base
  
  validates :date, :venue, :city, :presence => true
  validates :venue_link, :tickets_link, :format => {
    :with => /\Ahttp/,
    :message => "Need the full URL, with http at the beginning"
  }, :allow_blank => true
end
