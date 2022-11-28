class OrganizationsController < ApplicationController
  def show
    authorize Organization
  end

  # alert: no authlevel!
  def new
    @organization = Organization.new
    authorize @organization
  end

  # alert: no authlevel!
  def create
    @organization = Organization.new(organization_params)
    authorize @organization
    if @organization.save
      @organization.permissions.create!(user_id: current_user.id,
                                        authlevel: DmUniboCommon::Authorization::TO_MANAGE)
      render 'subscriptions/create'
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @organization.update(organization_params)
    redirect_to organizations_path, notice: 'La struttura è stata aggiornata.'
  end

  private

  def organization_params
    params[:organization].permit(:code, :name, :description)
  end
end
