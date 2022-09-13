class ReservationPolicy < ApplicationPolicy
  def update?
    @user.admin?
  end

  def finish?
    @user.admin?
  end
  
  def edit?
    @user.admin?
  end
end
