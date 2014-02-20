# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/img_01.jpg')))
  end
end
