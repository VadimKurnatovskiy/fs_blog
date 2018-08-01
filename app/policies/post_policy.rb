class EventPolicy < ApplicationPolicy

  def update?
    user_owner?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def user_owner?
    record.user == user
  end
end
