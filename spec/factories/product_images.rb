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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_image do
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/img_01.jpg')))
    product
  end
end
