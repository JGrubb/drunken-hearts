require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    factory :admin do
      is_admin true
    end
  end
end
