class BroadcastPostJob < ApplicationJob
  queue_as :low_priority

  def perform (post_id)
    post = Post.find_by_id(post_id)
    serialized_data = ActiveModelSerializers::Adapter::Json.new(
      PostSerializer.new(post)
    ).serializable_hash
    ActionCable.server.broadcast 'posts_channel', serialized_data
  end
end