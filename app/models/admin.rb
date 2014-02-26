class Admin < ActiveRecord::Base
  has_secure_password
  
  before_save { |admin| admin.username = username.downcase }
  before_save :create_remember_token

  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
end
