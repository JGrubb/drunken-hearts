module Features
  module SessionHelpers
    def sign_in_admin
      jimmy = create :admin
      
      visit root_path
      click_link 'login'
      fill_in 'user[email]', with: jimmy.email
      fill_in 'user[password]', with: jimmy.password
      click_button 'Sign in'
    end
  end
end
