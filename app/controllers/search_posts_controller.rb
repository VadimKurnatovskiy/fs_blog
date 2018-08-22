class SearchPostsController < ApplicationController
  expose_decorated(:posts) { posts_by_params_finder }
  expose_decorated(:post)
  def index
  end

  private

  def permitted_params
    params.permit(:search, :order, :page)
  end

  def posts_by_params_finder
    @posts = FindPosts.new.call(permitted_params)
  end

end
