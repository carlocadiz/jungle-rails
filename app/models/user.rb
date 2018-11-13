class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, length: { minimum: 6 }


private

  def self.authenticate_with_credentials(email, password)


    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      @user = user
    else
      nil
    end
  end
end
