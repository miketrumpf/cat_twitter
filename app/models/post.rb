class Post < ApplicationRecord
  has_many :posts_users
  has_and_belongs_to_many :users
end
