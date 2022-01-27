class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = Post.all.where("author_id = ?", params[:id]).limit(3).order(created_at: :desc)
  end
end
