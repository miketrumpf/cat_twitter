class User < ApplicationRecord
  has_secure_password
  
  validates :password, presence: true, confirmation: true

  validates :email, uniqueness: true

end
