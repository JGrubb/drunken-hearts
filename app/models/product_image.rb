# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  product_id :integer
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ProductImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :product
  validates :image, presence: true
end
