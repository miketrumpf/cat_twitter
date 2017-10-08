class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, confirmation: true

  validates :email, uniqueness: true
  has_many :posts_users
  has_many :posts, through: :posts_users
end
