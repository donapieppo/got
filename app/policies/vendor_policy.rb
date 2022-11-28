class VendorPolicy < ApplicationPolicy
  def show?
    @user
  end

  def create?
    @user
  end

  def update?
    @user
  end

  def destroy?
    false
  end
end

