require 'spec_helper'

describe "Player Listing" do
  describe "Player Listing Page" do
    it "should have the content 'Player List'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/players'
      expect(page).to have_content('Player List')
    end
  end
end
