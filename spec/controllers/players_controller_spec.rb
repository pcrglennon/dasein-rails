require 'spec_helper'

describe PlayersController do

  describe 'non-admin tries to do stuff' do
    let(:player) { FactoryGirl.create(:player) }
    describe 'non-admin tries to delete user' do
      before { delete player_path(player) }
      specify { expect(response).to redirect_to(admin_login_path) }
    end
  end
end