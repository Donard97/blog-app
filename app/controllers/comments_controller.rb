class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:id])
    @comment.text = params[:text]
    @comment.author_id = current_user.id
    if @comment.save
      flash[:notice] = 'Comment successfully added!'
      redirect_to user_posts_path
    else
      render 'new'
    end
  end
end
