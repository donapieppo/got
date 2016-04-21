class AdminsController < ApplicationController
  before_action :set_organization_and_check_permission

  def new
    @admin = @organization.admins.new
  end

  def create
    @admin = @organization.admins.new(admin_params)
    if @admin.save
      redirect_to organization_path(@organization), notice: 'Utente aggiunto.'
    else
      render :new
    end
  end

  private

  def set_organization_and_check_permission
    if current_user.is_cesia? and params[:organization_id]
      @organization = Organization.find(params[:organization_id])
    else
      @organization = @current_organization
    end
  end

  def admin_params
    params[:admin].permit(:user_upn)
  end
end


