# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    email "MyString"
    guid "MyString"
    address "MyText"
  end
end
