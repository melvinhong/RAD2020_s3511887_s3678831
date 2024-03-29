class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token
  validates :name, presence: true, length: { maximum: 50 }
  # Email validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
             length: { maximum: 255 },
             format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }
  before_save { self.email = self.email.downcase }
  has_secure_password
  # Password validation
  validates :password, presence: true, length: { minimum: 8, maximum: 20 }, :if => :password
  # Mobile number validation
  VALID_MOBILE_REGEX = /\d/
  validates :mobile, presence: true,
             length: { minimum:10},
             format: { with: VALID_MOBILE_REGEX }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one  :verification, dependent: :destroy
  # Avatar upload
  mount_uploader :avatar, AvatarUploader

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = self.new_token
    update_attribute(:remember_digest, self.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Sets the password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_timestamp, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_timestamp < 2.hours.ago
  end
end
