module Users
  class PostsController < ApplicationController
    before_action :authenticate_user!
    expose_decorated(:post)
    expose_decorated(:comments) { post.comments.includes(:user) }

    def create
      post.user = current_user
      post.save
      respond_with post
    end

    def destroy
      post.destroy
      respond_with post
    end

    def new
    end

    def update
      post.save
      respond_with post
    end

    def edit
    end
  end
end
