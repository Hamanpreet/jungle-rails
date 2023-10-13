class User < ApplicationRecord
  before_validation :downcase_email


  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 }
  has_secure_password

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def self.authenticate_with_credentials(email, password)
    # Remove leading and trailing spaces from the email
    email1 = email.strip

    # Convert the email to lowercase for case-insensitive matching
    email2 = email1.downcase
    puts "Here is #{email2}"
    user = User.find_by_email(email2)
    if user && user.authenticate(password)
      return user
    else
      nil
    end
  end
end
