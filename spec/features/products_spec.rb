require 'spec_helper'

feature "Product Management" do
  scenario "creating a new product", :js => true do
    jimmy = create :admin

    visit root_path
    click_link 'login'
    fill_in 'user[email]', with: jimmy.email
    fill_in 'user[password]', with: jimmy.password
    click_button 'Sign in'

    visit root_path
    save_and_open_page
    expect {
      click_link 'Admin'
      click_link 'New Product'
      fill_in 'Title', with: "Awesome T Shirt"
      fill_in 'Description', with: "Will get you plenty of tail"
      click_button 'Create Product'
    }. to change(Product, :count).by 1
  end
end
