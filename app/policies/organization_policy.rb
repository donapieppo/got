class OrganizationPolicy < DmUniboCommon::OrganizationPolicy
  configure_authlevels

  def show?
    true
  end

  # everyone can crate. When created he has permission on 
  def create?
    true
  end

  def edit?
    @user.authorization.can_manage?(@record)
  end

  def add_printer?
    edit?
  end

  def add_toner?
    edit?
  end
end
