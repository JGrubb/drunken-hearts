# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  caption    :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :image, :presence => true
end
