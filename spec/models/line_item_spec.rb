require 'spec_helper'

describe LineItem do
  it "is valid with a cart id and product id" do
    line_item = create(:line_item)
  end

  pending "is invalid without a cart id" do
    line_item = create(:line_item, :cart => nil)
    expect(line_item).to have(1).error_on :cart
  end

  pending "is invalid without a product id" do
    line_item = create(:line_item, :product => nil)
    expect(line_item).to have(1).error_on :product
  end

  

end
