class PrinterPolicy < ApplicationPolicy
  def create?
    record_organization_manager?
  end

  def update?
    create?
  end
end

