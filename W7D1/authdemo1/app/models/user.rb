class User < ApplicationRecord
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: {message: 'Password can\'t be blank'}
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :session_token, presence: true, uniqueness: true
  before_validation :ensure_session_token


  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end


  def is_password?(pw)
    BCrypt::Password.new(password_digest).is_password?(pw)
  end

  def reset_session_token!
    self.session_token = generate_unique_session_token
    self.save!
    self.session_token
  end

  private

  def generate_unique_session_token
    # `SecureRandom::urlsafe_base64` does not guarantee uniqueness. Wrapping
    # this call in a loop ensures that no other user has the generated token.
    loop do
      session_token = SecureRandom::urlsafe_base64(16)
      return session_token unless User.exists?(session_token: session_token)
    end
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end
end
end