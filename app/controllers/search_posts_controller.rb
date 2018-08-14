class SearchPostsController < ApplicationController
  expose(:posts) { posts_by_params_finder }

  def index
  end

  private

  def permitted_params
    params.permit(:search, :page)
  end

  def posts_by_params_finder
    @posts = FindPosts.new(Post.all).call(permitted_params)
  end

end
