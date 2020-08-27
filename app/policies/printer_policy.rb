class PrinterPolicy < ApplicationPolicy
  def show?
    record_organization_manager?
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

