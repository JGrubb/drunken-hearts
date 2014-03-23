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

require 'spec_helper'

describe Product do
  it "is valid with a title and description and price" do
    product = create :product
    expect(product).to be_valid
  end

  it "is valid with a title, description, price, and image" do
    product = create :product_w_images
    expect(product).to be_valid
  end

  it "is invalid without a title" do
    product = build(:product, title: nil)
    expect(product).to have(1).error_on :title
  end

  it "is invalid without a description" do
    product = build(:product, description: nil)
    expect(product).to have(1).error_on :description
  end

  it "is invalid without a price" do
    product = build(:product, price: nil)
    expect(product).to have(1).error_on :price
  end

  it "allows multiple images to be attached" do
    product = create(:product_w_images)
    expect(product.product_images.count).to eq 3
  end

  it "converts from dollars to cents for the database" do
    product = create(:product, price: 999)
    expect(product.price).to eq 999
    expect(product.price_in_dollars).to eq 9.99
  end
end
