# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  download    :string(255)
#  description :text
#  price       :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  published   :boolean          default(FALSE)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "Awesome T Shirt"
    description "Lorem Lorem Lorem"
    price_in_dollars 9.99
    published true

    factory :product_w_images do
      after(:build) do |product, evaluator|
        create_list(:product_image, 3, product: product)
      end
    end
  end
end
