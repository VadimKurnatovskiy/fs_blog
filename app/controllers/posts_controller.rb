class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
  skip_authorize_resource only: [:index, :show]
  expose_decorated(:post, attribute: :post_params)
  expose_decorated(:posts) { recent_posts_finder }
  expose_decorated(:comments) { posts_comments }
  expose_decorated(:comment) { new_comment }

  def index
  end

  def show
  end

  private

  def new_comment
    comments.new
  end

  def posts_comments
    post.comments.includes(:user).order(created_at: :desc)
  end

  def recent_posts_finder
    Post.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
