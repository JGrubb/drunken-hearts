# == Schema Information
#
# Table name: shows
#
#  id           :integer          not null, primary key
#  date         :date
#  venue        :string(255)
#  city         :string(255)
#  venue_link   :string(255)
#  info         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tickets_link :string(255)
#

class Show < ActiveRecord::Base
  
  validates :date, :venue, :city, :presence => true
  validates :venue_link, :tickets_link, :format => {
    :with => /\Ahttp/,
    :message => "Need the full URL, with http at the beginning"
  }, :allow_blank => true
end
