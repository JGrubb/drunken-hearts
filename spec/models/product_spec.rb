require 'spec_helper'

describe Product do
  it "is valid with a title and description" do
    product = create :product
    expect(product).to be_valid
  end

  it "is valid with a title, description, and image" do
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

  it "allows multiple images to be attached" do
    product = create(:product_w_images)
    expect(product.product_images.count).to eq 3
  end
end
