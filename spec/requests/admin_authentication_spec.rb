require 'spec_helper'

require '../helpers/admin/utilities'

describe 'admin authentication' do

  subject { page }

  describe 'admin login' do

    before { visit admin_login_path }

    describe 'invalid login' do
      before { click_button 'Log In' }
      it { should have_title("Administrator Login")}
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe 'visiting another page' do
        before { visit root_url }
        it { should_not have_selector('div.alert.alert-error', text: 'Invalid')}
      end
    end
    describe 'valid login' do
      let (:admin) { FactoryGirl.create(:admin) }
      before do
        fill_in 'Username',  with: admin.username.upcase
        fill_in 'Password', with: admin.password
        click_button 'Log In'
      end
      it { should have_title('Administration')}
      it { should have_link('Manage Players')}
      it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      it { should have_link('Log Out') }

      describe 'visiting another page' do
        before { visit root_url }
        it { should_not have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end