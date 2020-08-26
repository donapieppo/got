class PermissionPolicy < ApplicationPolicy
  def create?
    record_organization_manager?
  end

  def destroy?
    create?
  end
end

