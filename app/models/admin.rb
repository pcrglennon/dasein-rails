class Admin < ActiveRecord::Base
  validates :username, presence: true,
            length: { maximum: 40 },
            uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  #presence of password validated by has_secure_password

  has_secure_password

  before_save { self.username = username.downcase }
end
