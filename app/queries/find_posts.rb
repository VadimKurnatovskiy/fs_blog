class FindPosts
  attr_accessor :initial_scope

  def initialize(initial_scope = Post.all)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(initial_scope, params[:search])
    scoped = order(scoped)
    scoped = paginate(scoped, params[:page])
    scoped
  end

  private

  def search(scoped, query = nil)
    query ? scoped.where('title SIMILAR TO :title_query OR content SIMILAR TO :content_query', content_query: content_query(query), title_query: title_query(query)) : scoped
  end

  def content_query(query)
    "%(#{query.gsub(/[^\w\s]/) { |ch| "^#{ch}" }.split(' ').join('|').downcase})%"
  end

  def title_query(query)
    "%(#{query.gsub(/[^\w\s]/) { |ch| "^#{ch}" }.downcase})%"
  end

  def order(scoped)
    scoped.order(created_at: :desc)
  end

  def paginate(scoped, page_number = 1)
    scoped.page(page_number)
  end
end
