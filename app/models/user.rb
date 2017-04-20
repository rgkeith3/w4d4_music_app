class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  before_validation :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    session_token = SecureRandom::urlsafe_base64(16)

    while User.where(session_token: session_token).exists?
      session_token = SecureRandom::urlsafe_base64(16)
    end

    session_token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return user if user.is_password?(password)
    nil
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
