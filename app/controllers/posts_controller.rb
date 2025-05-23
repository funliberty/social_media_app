class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])

    redirect_to :root if @post.nil?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to :root and return
    end
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def post_params
    params.expect(post: [ :title, :description ])
  end
end
