class PostsController < ApplicationController
  def index
    # @user = User.find_by_id(params[:user_id])
    # @posts = Post.all.where('author_id = ?', params[:user_id]).order(created_at: :desc)
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def show
    # @post = Post.find_by_id(params[:id])
    # @user = User.find_by_id(params[:user_id])
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
  end

  def new
    @user = User.find_by_id(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(title: post_params[:title], text: post_params[:text], commentsCounter: 0, likesCounter: 0)

    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Something went wrong'
      render :new
    end
  end

  private

  def post_params
    params.permit(:title, :text)
  end
end
