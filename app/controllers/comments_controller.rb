class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(author_id: current_user.id, post_id: params[:post_id], **comment_params)

    if @comment.save
      flash[:notice] = "Comment created successfully"
      redirect_to post_path(params[:post_id])
    else
      flash.now[:alert] = "Comment could not be created"
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end