class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :user, :title, :content

  scope :by_user, -> (user) { where(user: user) }
end
