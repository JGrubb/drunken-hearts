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
