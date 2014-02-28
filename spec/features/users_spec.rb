require 'spec_helper'

feature 'User Management' do
  scenario "Lets Jimmy log in as an admin and sign out" do
    sign_in_admin

    expect(page).to have_content "Signed in successfully."

    click_link 'Logout'
    expect(page).to have_content "Signed out successfully."
  end

  scenario "Makes sure admins can see the admin menu" do
    sign_in_admin

    click_on "Admin"
    expect(page).to have_link "Admin"
  end
end
