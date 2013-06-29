require 'spec_helper'

"""
describe 'Manage Players Do' do

  subject { page }

  before { visit admin_login_path }

  describe 'Log In' do
    let (:admin) { FactoryGirl.create(:admin) }
    before do
      fill_in 'Username',  with: admin.username.upcase
      fill_in 'Password', with: admin.password
      click_button 'Log In'
    end
    describe 'Manage Players' do
      click_link 'Manage Players'
      current_path.should eq admin_players_path
    end
    describe 'Add New Player' do

    end
  end
end
"""