class TonerPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    record_organization_manager?
  end

  def update?
    record_organization_manager?
  end
end

