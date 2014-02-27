require 'spec_helper'

feature 'User Management' do
  scenario "Lets Jimmy log in as an admin and sign out" do
    jimmy = create :admin
    
    visit root_path
    click_link 'login'
    fill_in 'user[email]', with: jimmy.email
    fill_in 'user[password]', with: jimmy.password
    click_button 'Sign in'

    #visit root_path
    expect(page).to have_content "Signed in successfully."

    click_link 'Logout'
    expect(page).to have_content "Signed out successfully."
  end
end
