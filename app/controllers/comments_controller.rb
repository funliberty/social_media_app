class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_path, params: { error: @comment.errors.full_messages }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
