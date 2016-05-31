class TonerModelsController < ApplicationController
  before_action :set_toner_model, only: [:show, :edit, :update, :destroy]

  def index
    @toner_models = TonerModel.includes(:printer_models)
    @organization_toner_model_ids = @current_organization.toner_model_ids
  end

  def new
    @toner_model = TonerModel.new(vendor_id: params[:vendor_id])
  end

  def edit
    render :new
  end

  def create
    @toner_model = TonerModel.new(toner_model_params)
    if @toner_model.save
      redirect_to toner_models_path, notice: 'toner was successfully created.'
    else
      render :new
    end
  end

  def update
    if @toner_model.update(toner_model_params)
      redirect_to toner_models_path, notice: 'toner was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @toner_model.destroy
    redirect_to toner_models_path, notice: 'toner was successfully destroyed.'
  end

  private
    def set_toner_model
      @toner_model = TonerModel.find(params[:id])
    end

    def toner_model_params
      params[:toner_model].permit(:name, :laser, :vendor_id, printer_model_ids: [])
    end
end
