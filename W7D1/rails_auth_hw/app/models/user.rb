class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { 'Password can\'t be blank!' }
  validates :password, length: {minimum: 5, allow_nil = true }
  before_validation :ensure_session_token

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    return nil if user.nil?

  end
end
