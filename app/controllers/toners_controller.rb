class TonersController < ApplicationController
  before_action :set_toner_and_check_permission, only: [:edit, :update, :destroy]

  def new
    @toner = @current_organization.toners.new
  end

  def create
    @toner = @current_organization.toners.new(toner_params)
    if @toner.save
      redirect_to organization_path(@current_organization), notice: 'il toner è stato aggiunto come disponibile.'
    else
      render :new
    end
  end
  
  def edit
    render :new
  end

  def update
    if @toner.update_attributes(toner_params)
      redirect_to organization_path(@current_organization), notice: 'il toner è stato aggiornato.'
    else
      render :new
    end
  end

  def destroy
    @toner.delete 
    redirect_to organization_path(@current_organization), notice: 'il toner è stato eliminato da quelli disponibili.'
  end

  private

  def toner_params
    params[:toner].permit(:number, :toner_model_id)
  end

  def set_toner_and_check_permission
    @toner = @current_organization.toners.find(params[:id])
  end

end


