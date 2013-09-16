class Admin < ActiveRecord::Base
  validates :username, presence: true,
            length: { maximum: 40 },
            uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  #presence of password validated by has_secure_password

  has_secure_password

  before_create :create_remember_token
  before_save { self.username = username.downcase }

  def Admin.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def Admin.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  
  private

    def create_remember_token
      self.remember_token = Admin.encrypt(Admin.new_remember_token)
    end

end
