# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  band_id         :bigint
#
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  before_validation :ensure_session_token

  attr_reader :password

  # belongs_to :band,
  #   primary_key: :id,
  #   foreign_key: :band_id,
  #   class_name: :Band,
  #   inverse_of: :members


  def password=(pw)
    self.password_digest = BCrypt::Password.create(pw)
    @password = pw
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def self.find_by_credentials(email, pw)
    user = User.find_by(email: email)
    return nil if user.nil?
    return user if user.is_password?(pw)
  end

  def generate_unique_token
    token = SecureRandom.urlsafe_base64(30)

    while User.exists?(session_token: token)
      token = SecureRandom.urlsafe_base64(30)
    end

    token
  end

  def reset_session_token!
    self.session_token = generate_unique_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_unique_token
  end
end
