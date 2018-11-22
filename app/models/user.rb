class User < ApplicationRecord
  has_many :posts
  has_many :replies
  has_many :votes
end
