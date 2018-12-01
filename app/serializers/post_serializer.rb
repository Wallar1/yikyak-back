class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :content, :lat, :lng, :created_at

  has_many :replies, class_name: 'Reply'
  has_many :votes

  def created_at
    self.object.created_at.localtime.strftime("%A %m/%d/%Y at %I:%M%P")
  end
end
