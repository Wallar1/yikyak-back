class PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts
  end

  def create
    post = Post.new(post_params)
    if(post.save)
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        PostSerializer.new(post)
      ).serializable_hash
      ActionCable.server.broadcast 'posts_channel', serialized_data
      head :ok
    end
  end

  private

  def post_params
    params.require(:post).permit!
  end
end
