require 'spec_helper'

feature "Product Management" do
  scenario "creating a new product" do
    sign_in_admin

    expect {
      click_on 'Admin'
      click_link 'New Product'
      fill_in 'Title', with: "Awesome T Shirt"
      fill_in 'Description', with: "Will get you plenty of tail"
      attach_file :product_image, File.new("#{Rails.root}/spec/fixtures/files/img_01.jpg")
      click_button 'Create Product'
    }. to change(Product, :count).by 1
  end

  scenario "viewing a new product" do
    sign_in_admin
    product = create :product_w_images

    visit product_path(product)
    expect(page).to have_content "Awesome T Shirt"
  end
end
