# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  product_id :integer
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe ProductImage do
  it "is valid with an image" do
    image = create :product_image
    expect(image).to be_valid
  end

  it "is invalid without an image" do
    image = build(:product_image, image: nil)
    expect(image).to have(1).error_on :image
  end
end
