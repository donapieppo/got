class OrganizationsController < ApplicationController
  before_action :set_organization_and_check_permission, only: [:show, :edit, :update, :destroy]

  def show
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
      render :new
    end
  end

  def edit
  end

  def update
    @organization.update_attributes(organization_params)
    redirect_to organizations_path, notice: 'La struttura è stata aggiornata.'
  end

  private

  def organization_params
    params[:organization].permit(:code, :name, :description)
  end

  def set_organization_and_check_permission
    @organization = Organization.find(params[:id])
    authorize @organization
  end
end

