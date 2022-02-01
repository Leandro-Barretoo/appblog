class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(text: params[:text], author_id: params[:user_id], post_id: params[:post_id])
        if @comment.save
            redirect_to user_post_path(params[:user_id], params[:post_id])
        else
            render :new
        end
    end
end
