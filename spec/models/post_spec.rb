require 'spec_helper'

describe Post do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:post) { FactoryGirl.create(:post, admin: admin) }

  subject { post }

  its(:admin) { should eq admin }

  it { should be_valid }

  describe 'admin_id not present' do
    before { post.admin_id = nil }
    it { should_not be_valid }
  end

  describe 'no content' do
    before { post.content = '' }
    it { should_not be_valid }
  end

  describe 'no title' do
    before { post.title = '' }
    it { should_not be_valid }
  end
end
