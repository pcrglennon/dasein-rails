require 'spec_helper'

describe Admin do
  before do
    @admin = Admin.new(username: "Example Admin")
  end

  subject { @admin }

  it { should respond_to(:username) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should be_valid }

  puts "\n\nTODO - Client Side Validation!\n"

end
