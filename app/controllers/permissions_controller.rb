class PermissionsController < ApplicationController
  def index
    # need becouse org.permissions are DmUniboCommon::Permissions 
    @permissions = Permission.where(organization_id: current_organization.id)
    authorize current_organization, :read? 
    render layout: false if modal_page
  end

  def new
    @permission = Permission.new(organization_id: current_organization.id)
    authorize @permission
  end

  def create
    @permission = Permission.new(organization_id: current_organization.id, 
                                 user_upn: params[:permission][:user_upn], 
                                 authlevel: DmUniboCommon::Authorization::TO_MANAGE)
    authorize @permission
    if @permission.save
      redirect_to permissions_path, notice: 'Utente aggiunto.'
    else
      raise @permission.errors.inspect
      render action: :new, status: :unprocessable_entity
    end
  end

  def destroy
    permission = Permission.find(params[:id])
    authorize permission
    permission.destroy and flash[:notice] = 'Amministratore cancellato correttamente.'
    redirect_to permissions_path
  end
end


