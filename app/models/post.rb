class Post < ApplicationRecord
  has_many :replies, class_name: 'Reply'
  has_many :votes
  belongs_to :user
end
