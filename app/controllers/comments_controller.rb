class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource 
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
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
    flash[:succes] = 'Comment was deleted successfully'
    redirect_to user_post_path(current_user)
  end

  private

  def comment_params
    params.permit(:text)
  end
end
