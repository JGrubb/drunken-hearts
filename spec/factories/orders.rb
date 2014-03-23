# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  guid       :string(255)
#  address    :text
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    email "MyString"
    guid "MyString"
    address "MyText"
  end
end
