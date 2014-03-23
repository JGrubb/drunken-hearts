# == Schema Information
#
# Table name: shows
#
#  id           :integer          not null, primary key
#  date         :date
#  venue        :string(255)
#  city         :string(255)
#  venue_link   :string(255)
#  info         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tickets_link :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :show do
    date 1.week.from_now
    venue { Faker::Name.name }
    city { Faker::Address.city }
    factory :show_w_links do
      venue_link { Faker::Internet.url }
      tickets_link { Faker::Internet.url }
    end
    factory :past_show do
      date 1.week.ago
    end
  end
end
