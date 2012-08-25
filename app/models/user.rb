class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :displayusername
  has_secure_password
  before_save { |user| user.displayusername = username }
  before_save { |user| user.username = username.downcase }
  before_save :create_remember_token

  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end