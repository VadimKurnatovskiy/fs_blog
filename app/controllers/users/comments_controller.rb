class Users::CommentsController < ApplicationController
  load_and_authorize_resource
  expose(:post)
  expose(:comment, attributes: :comment_params)
  expose(:comments, ancestor: :post)

  def create
    comment.user = current_user
    comment.post = post
    comment.save
    respond_with post
  end

  def destroy
    comment.destroy
    respond_with post
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
