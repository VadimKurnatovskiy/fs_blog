class UserDecorator < ApplicationDecorator
  delegate_all

  def posts_count(id)
    count = Post.where(user_id: id).count
    count
  end

end
