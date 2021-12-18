class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @user = current_user
    @posts = Post.order(created_at: :desc).where(author_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:id])
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
end
