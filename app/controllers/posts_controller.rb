class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = Post.all.where('author_id = ?', params[:user_id]).order(created_at: :desc)
  end

  def show
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(params[:user_id])
  end

  def new
    @user = User.find_by_id(params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.create(author_id: params[:user_id], title: params[:title], text: params[:text])
    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end
end
