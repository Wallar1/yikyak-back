class HomeControllerController < ApplicationController
  def index
    @posts = Post.all.eager_load(:user,:replies)
  end
end
