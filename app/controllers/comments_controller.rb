class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :find_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created }
        format.js   { create_comment, action: 'create', comment_id: @comment.id, comment: @comment }
      else
        format.html { render template: 'posts/show', locals: { comment: @comment } }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js   { render errors: post.errors, status: not_proccessible }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
      format.js do
        delete_comment, action: 'delete', comment_id: @comment.id
        head :no_content
      end
    end
  end

  private
  def create_comment
    CommentsChannel.broadcast_to "post:#{@post.id}"
  end
  def delete_comment
    CommentsChannel.broadcast_to "post:#{@post.id}"
  end
  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
