class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = 'Comment successfully added!'
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment Deleted Succefully'
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.permit(:text)
  end
end
