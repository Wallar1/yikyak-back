class VoteSerializer < ActiveModel::Serializer
  attributes :id, :value, :user_id, :reply_id, :post_id

end
