class HomeController < ApplicationController

  def index
    posts = Post.all
    user = User.first
    render json: {
      posts: ActiveModel::Serializer::CollectionSerializer.new(posts, each_serializer: PostSerializer),
      user: UserSerializer.new(user),
    }
  end

  private 

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
