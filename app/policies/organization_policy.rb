class OrganizationPolicy < DmUniboCommon::OrganizationPolicy
  configure_authlevels

  def show?
    @user
  end

  # everyone can crate. When created he has permission on
  def create?
    @user
  end

  def edit?
    manage?
  end

  def add_printer?
    edit?
  end

  def add_toner?
    edit?
  end
end
