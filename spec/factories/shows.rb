# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :show do
    date Date.today
    venue "the Fillmore"
    city "Denver, CO"
    factory :show_w_links do
      venue_link "http://www.ignoredbydinosaurs.com"
      tickets_link "http://www.thedrunkenhearts.com"
    end
  end
end
