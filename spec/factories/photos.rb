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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/img_01.jpg')))
  end
end
