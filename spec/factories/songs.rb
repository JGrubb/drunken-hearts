# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  recording  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title "Art Pop"
    recording Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/artpop.mp3')))
  end
end
