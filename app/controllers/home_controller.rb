class HomeController < ApplicationController
  def index
    @posts = Post.all.eager_load(:user,:replies)
    json_response(@posts)
  end

  private 

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
