require 'spec_helper'

feature "Product Management" do
  scenario "creating a new product" do
    sign_in_admin

    expect {
      click_on 'Admin'
      click_link 'New Product'
      fill_in 'Title', with: "Awesome T Shirt"
      fill_in 'Description', with: "Will get you plenty of tail"
      click_button 'Create Product'
    }. to change(Product, :count).by 1
  end
end
