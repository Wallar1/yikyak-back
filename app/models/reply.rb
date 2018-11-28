class Reply < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
  has_many :votes
end
