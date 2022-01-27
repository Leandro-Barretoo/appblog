class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = Post.all.where("author_id = ?", params[:user_id]).order(created_at: :desc)
  end

  def show; end
end
