class RepliesController < ApplicationController
  
  def create
    reply = Reply.new(reply_params)
    post = Post.find(reply_params[:post_id])
    if(reply.save)
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ReplySerializer.new(reply)
      ).serializable_hash
      RepliesChannel.broadcast_to post, serialized_data
      head :ok
    end
  end


  private

  def reply_params
    params.require(:reply).permit!
  end
end
