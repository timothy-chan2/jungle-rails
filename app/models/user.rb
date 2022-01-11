class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email)
    # If the user exists AND the password entered is correct.
    if !(user && user.authenticate(password))
      user = nil
    end
    user
  end
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

end
