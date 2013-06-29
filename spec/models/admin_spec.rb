require 'spec_helper'

describe Admin do
  before do
    @admin = Admin.new(username: "Example Admin", password: "foobar", password_confirmation: "foobar")
  end

  subject { @admin }

  it { should respond_to(:username) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

  #Username validation

  describe 'When name is not present' do
    before { @admin.username = '' }
    it { should_not be_valid }
  end

  describe 'When name is too long' do
    before { @admin.username = 'a' * 41 }
    it { should_not be_valid }
  end

  describe 'When username is taken' do
    before do
      admin_duplicate_username = @admin.dup
      admin_duplicate_username.username = @admin.username.upcase
      admin_duplicate_username.save
    end
    it { should_not be_valid }
  end

  #Password Validation

  describe 'When password is not present' do
    before do
      @admin= Admin.new(username: "Example Admin", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "When password doesn't match confirmation" do
    before { @admin.password_confirmation = "uhohuhoh" }
    it { should_not be_valid }
  end

  describe 'When password confirmation is nil' do
    before do
      @admin = Admin.new(username: "Example Admin", password: "foobar", password_confirmation: nil)
    end
    it { should_not be_valid }
  end

  describe 'When password is too short' do
    before do
      @admin = Admin.new(username: "Example Admin", password: "foo", password_confirmation: "foo")
    end
    it { should_not be_valid }
  end

  #Authentication

  describe 'Return value of authenticate method' do
    before { @admin.save }
    let(:found_admin) { Admin.find_by(username: @admin.username) }

    describe 'with valid password' do
      it { should eq found_admin.authenticate(@admin.password) }
    end

    describe 'with invalid password' do
      let(:admin_invalid_password) { found_admin.authenticate("INCORRECT") }
      it { should_not eq admin_invalid_password }
      specify { expect(admin_invalid_password).to be_false }
    end
  end

end
