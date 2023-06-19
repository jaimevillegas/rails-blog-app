class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.includes(:author, :comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: current_user.id, title: params[:title], text: params[:text])

    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to "/users/#{current_user.id}/posts/#{@post.id}"

    else
      flash.now[:alert] = 'Post could not be created'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
