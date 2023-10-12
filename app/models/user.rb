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

end
