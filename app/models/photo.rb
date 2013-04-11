class Photo < ActiveRecord::Base
  attr_accessible :caption, :image
  mount_uploader :image, ImageUploader
end