class PrinterModelPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  # common to all
  def update?
    true
  end

  # common to all
  def create?
    true
  end
end


