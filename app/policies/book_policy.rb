class BookPolicy < ApplicationPolicy
  def create?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  # class Scope < Scope
  # end
end
