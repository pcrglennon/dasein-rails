class Admin < ActiveRecord::Base
  validates_presence_of :username, :password_confirmation
  #presence of password validated by has_secure_password 
  validates_uniqueness_of :username

  has_secure_password

  before_save { self.username = username.downcase }
end
