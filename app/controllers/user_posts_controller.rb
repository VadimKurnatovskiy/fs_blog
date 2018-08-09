class UserPostsController < ApplicationController
  expose_decorated(:posts) { posts_by_user_finder }

  def index
  end

  private

  def posts_by_user_finder
    Post.by_user(params[:user_id]).order(created_at: :desc).page(params[:page]).per(7)
  end
end
