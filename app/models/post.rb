class Post < ApplicationRecord
  has_many :replies, class_name: 'Reply'
  has_many :votes
  belongs_to :user, optional: true

  scope :within_2_days, -> {where("created_at > ?",Time.now - 2.days)}
end
