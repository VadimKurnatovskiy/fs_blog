class FindPosts
  attr_accessor :initial_scope

  def initialize(initial_scope = Post.all)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(initial_scope, params[:search])
    scoped = sort(scoped)
    scoped = paginate(scoped, params[:page])
    scoped
  end

  private

  def search(scoped, query = nil)
    query ? scoped.where('title LIKE :query OR content LIKE :query', query: "%#{query}%") : scoped
  end

  def sort(scoped)
    scoped.order(created_at: :desc)
  end

  def paginate(scoped, page_number = 1)
    scoped.page(page_number)
  end
end
