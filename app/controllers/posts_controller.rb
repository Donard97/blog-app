class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if current_user
      @post = current_user.posts.new(params[:id])
      @post.title = params[:title]
      @post.text = params[:text]
      if @post.save
        flash[:notice] = 'Post successfully added!'
        redirect_to user_posts_path
      else
        render 'new'
      end
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post Deleted Succefully'
    redirect_back fallback_location: root_path
  end
end
