module Features
  module SessionHelpers
    def sign_in(user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    def sign_in_admin_user(user)
      visit new_admin_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end    
  end
end
