class Api::CommentsController < ActionController::Base
  protect_from_forgery with: :null_session

  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    message = 'Verify Credentials'
    @user = User.find_by_id(params[:user_id])
    if @user.present?
      @post = Post.find_by_id(params[:post_id])
      if @post.present?
        @comment = Comment.new(author: @user, post: @post, text: params[:text])
        message = if @comment.save
                    'Comment Created'
                  else
                    'Comment Not Created'
                  end
        else
          message = 'Post Not Found'
        end
      else
        message = 'User Not Found'
    end

    render json: { message: message }
  end
end