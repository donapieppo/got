class HomePolicy < ApplicationPolicy
  def index?
    true
  end

  def search?
    true
  end

  def choose_organization?
    true
  end
end
