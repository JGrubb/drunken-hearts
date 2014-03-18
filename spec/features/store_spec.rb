require 'spec_helper'

feature "Shopping" do
  scenario "Adding an item to the cart" do
    product = create :product_w_images

    visit store_path
    within(find(:css, '.product')) do
      click_on 'Add to Cart'
    end
    expect(page).to have_content "Added Awesome T Shirt to cart!"
    #expect(current_user.cart.line_items.length).to be(1)
  end

  scenario "Viewing the product detail page" do
    product = create :product_w_images

    visit store_path
    within '.product' do
      click_on 'Details'
    end
    expect(page).to have_content "Awesome T Shirt"
    click_on 'Add to Cart'
    expect(page).to have_content "Added Awesome T Shirt to cart!"
  end
end
