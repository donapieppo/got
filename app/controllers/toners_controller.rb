class TonersController < ApplicationController
  before_action :set_toner_and_check_permission, only: [:edit, :update, :destroy]

  # only one toner of a certain toner_model in organization
  def new
    if params[:toner_model_id]
      @toner_model = TonerModel.find(params[:toner_model_id])
      if toner = @current_organization.toners.where(toner_model: @toner_model).first
        redirect_to [:edit, toner] and return
      end
    else
      @toner_model = TonerModel.first
    end
    @toner = @current_organization.toners.new(toner_model: @toner_model)
  end

  def create
    @toner = @current_organization.toners.new(toner_params)
    if @toner.save
      redirect_to organization_path(@current_organization), notice: 'Il toner è stato aggiunto.'
    else
      render :new
    end
  end
  
  def edit
    render :new
  end

  def update
    if @toner.update_attributes(toner_params)
      redirect_to organization_path(@current_organization), notice: 'Il toner è stato aggiornato.'
    else
      render :new
    end
  end

  def destroy
    @toner.delete 
    redirect_to organization_path(@current_organization), notice: 'Il toner è stato eliminato da quelli disponibili.'
  end

  private

  def toner_params
    params[:toner].permit(:number, :toner_model_id, :gift)
  end

  def set_toner_and_check_permission
    @toner = @current_organization.toners.find(params[:id])
  end

end


