class TonerPolicy < ApplicationPolicy
  # available toners for all (see controller)
  def index?
    true
  end

  def create?
    record_organization_manager?
  end

  def update?
    record_organization_manager?
  end

  def destroy?
    record_organization_manager?
  end
end

