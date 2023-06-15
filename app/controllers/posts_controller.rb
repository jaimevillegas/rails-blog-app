class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])

    begin
      @post = Post.where(author_id: @user.id).find(params[:id])
    rescue StandardError
      @post = nil
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: current_user.id, **post_params)

    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to user_post_path(params[:user_id])
    else
      flash.now[:alert] = "Post could not be created"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
