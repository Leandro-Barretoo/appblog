class LikesController < ApplicationController
  def new; end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.author_id = params[:user_id]

    if @like.save
      flash[:success] = 'Like saved successfully'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:error] = 'Something went wrong'
    end
  end
end
