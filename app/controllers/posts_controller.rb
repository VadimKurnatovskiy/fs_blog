class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
  skip_authorize_resource only: [:index, :show]
  expose_decorated(:post, attribute: :post_params)
  expose_decorated(:posts) { recent_posts_finder }
  expose_decorated(:comments) { post.comments.includes(:user) }
  expose(:comment) { post.comments.new }

  def index
  end

  def show
  end

  private

  def recent_posts_finder
    Post.includes(:user).order(created_at: :desc).page(params[:page]).per(7)
  end

  def post_params
    params.require(:post).permit(:title, :text, :user)
  end
end
