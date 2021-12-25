class Api::PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @posts = Post.all
    render json: { success: true, message: 'Loaded all posts', data: { posts: @posts } }
  end
end
