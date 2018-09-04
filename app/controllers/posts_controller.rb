class PostsController < ApplicationController
  load_and_authorize_resource
  expose_decorated(:post)
  expose_decorated(:posts) { recent_posts_finder }
  expose_decorated(:comments) { posts_comments }
  
  def index
  end

  def show
  end

  private

  def posts_comments
    post.comments.includes(:user).order(created_at: :desc)
  end

  def recent_posts_finder
    Post.includes(:user).order(created_at: :desc).page(params[:page])
  end
end
