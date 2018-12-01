class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    if(post.save)
      BroadcastPostJob.perform_later(post.id)
    end
  end

  def update
    post = Post.find(post_params[:id])
    if(post.update(post_params))
      BroadcastPostJob.perform_later(post.id)
    end
  end


  private

  def post_params
    params.require(:post).permit!
  end
end
