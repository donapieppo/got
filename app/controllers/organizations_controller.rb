class OrganizationsController < ApplicationController
  before_action :user_cesia!, except: [:index, :show]
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  # solo cesia puo' vedere altro che current_organization
  def show
    @organization = current_user.is_cesia? ? Organization.find(params[:id]) : @current_organization

    @available_toners = @organization.available_toners
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to organizations_path, notice: 'Struttura creata correttamente.'
    else
      render :new
    end
  end

  private

  def organization_params
    params[:organization].permit(:name, :description)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end

