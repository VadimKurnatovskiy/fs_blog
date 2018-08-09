class PostPolicy < ApplicationPolicy
  def owner?
    record.user == user
  end
end
