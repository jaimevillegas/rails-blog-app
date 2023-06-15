class LikesController < ApplicationController
  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])

    if @like.save
      flash[:notice] = "Like created successfully"
    else
      flash.now[:alert] = "Like could not be created"
    end
    redirect_to post_path(params[:user_id])
  end