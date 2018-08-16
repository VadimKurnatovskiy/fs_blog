module Users
  class PostsController < ApplicationController
    before_action :authenticate_user!
    expose_decorated(:post, attributes: :post_params)
    expose_decorated(:comments) { post.comments.includes(:user) }

    def create
      post.user = current_user
      if post.save
        respond_with post
      else
        render "new"
      end
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

    private

    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
end
