# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true 
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  attr_reader :password

  has_many :subs,
  foreign_key: :moderator_id,
  class_name: :Sub 

  has_many :posts,
  through: :subs,
  source: :posts

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    if user && user.is_password?(pw)
      return user
    else 
      nil 
    end
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

end
