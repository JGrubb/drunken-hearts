require 'spec_helper'

feature "Shopping" do
  scenario "Adding an item to the cart" do
    product = create :product_w_images

    visit store_path
    within(find(:css, '.product')) do
      click_on 'Add to Cart'
    end
    expect(page).to have_content "Added Awesome T Shirt to cart!"
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

  scenario "Viewing your cart" do
    product = create :product_w_images

    visit store_path
    within '.product' do
      click_on 'Add to Cart'
      click_on 'Add to Cart'
    end
    click_on "My Cart"
    expect(page).to have_content "2 Awesome T Shirt"
    expect(page).to have_content "$19.98"
  end

  scenario "Emptying your cart" do
    product = create :product_w_images

    visit store_path
    within '.product' do
      click_on 'Add to Cart'
      click_on 'Add to Cart'
    end
    click_on "My Cart"
    expect(page).to have_content "2 Awesome T Shirt"
    click_on "Empty your cart"
    expect(page).to have_content "Awesome T Shirt"
  end
end
