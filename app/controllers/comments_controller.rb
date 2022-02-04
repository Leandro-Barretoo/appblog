class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author_id = params[:user_id]

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:error] = 'Something went wrong'
      render :new
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
