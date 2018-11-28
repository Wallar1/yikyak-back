class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :content, :lat, :lng, :created_at

  has_many :replies, class_name: 'Reply'
end
