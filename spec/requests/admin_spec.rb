require 'spec_helper'

describe 'Manage Players Do' do
  it 'Manage Players' do
    visit admin_path
    click_link 'Manage Players'
    current_path.should eq admin_players_path
  end
  it 'Add New Player' do

  end
end
