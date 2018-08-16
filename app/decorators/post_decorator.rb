class PostDecorator < ApplicationDecorator
  delegate_all

  def author
    user.name
  end

  def comments_number
    comments.count
  end

  def text_html
    content.html_safe
  end
end
