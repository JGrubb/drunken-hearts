# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "Awesome T Shirt"
    description "Lorem Lorem Lorem"
    price 9.99
    published true

    factory :product_w_images do
      after(:build) do |product, evaluator|
        create_list(:product_image, 3, product: product)
      end
    end
  end
end
