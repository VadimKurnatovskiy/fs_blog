class Post < ActiveRecord::Base
  paginates_per 7
  belongs_to :user
  has_many :comments

  validates_presence_of :user, :title, :content

  scope :by_user, -> (user) { where(user: user) }
end
