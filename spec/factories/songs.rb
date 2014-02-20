# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title "Art Pop"
    recording Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/artpop.mp3')))
  end
end
