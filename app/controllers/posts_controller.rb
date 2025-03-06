class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

    @post = Post.find(params[:id])
  end
end
