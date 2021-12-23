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
    @post = Post.new
    @post.title = params[:title]
    @post.text = params[:text]
    @post.author_id = current_user.id
    if @post.save
      flash[:notice] = 'Post successfully added!'
      redirect_to user_posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post was successfully created.'
    redirect_to user_post_path(current_user)
  end
end
