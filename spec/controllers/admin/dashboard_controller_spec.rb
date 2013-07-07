require 'spec_helper'

describe Admin::DashboardController do

  describe 'Visit Dashboard' do
    before { visit admin_login_path }

    describe 'Log In' do
      let (:admin) { FactoryGirl.create(:admin) }
      before do
        fill_in 'Username',  with: admin.username.upcase
        fill_in 'Password', with: admin.password
        click_button 'Log In'
      end
      expect(current_path.should eq admin_path)

      it 'Click Manage Players button' do
        before do
          visit admin_login_path
          click_button 'Manage Players'
        end
        expect(current_path.should eq admin_players_path)
      end
    end
  end

end
