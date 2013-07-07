
module Utilities

  def login
    let (:admin) { FactoryGirl.create(:admin) }
    before do
      fill_in 'Username',  with: admin.username.upcase
      fill_in 'Password', with: admin.password
      click_button 'Log In'
    end
  end

  def logout

  end
end