class TonerModelsController < ApplicationController
  before_action :set_toner_model_and_check_authorization, only: [:show, :edit, :update, :destroy]

  def index
    @toner_models = TonerModel.includes(:printer_models)
    @organization_toner_model_ids = current_organization.toner_model_ids
    authorize :toner_model
  end

  # remote
  def show
    @compatible_printers = @toner_model.printer_models
    @available_toners = @toner_model.toners
  end

  def new
    @toner_model = TonerModel.new(vendor_id: params[:vendor_id])
    authorize @toner_model
  end

  def create
    @toner_model = TonerModel.new(toner_model_params)
    authorize @toner_model
    if @toner_model.save
      redirect_to toner_models_path, notice: "toner was successfully created."
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def edit
    @actual_toners = @toner_model.toners.includes(:organization)
  end

  def update
    if @toner_model.update(toner_model_params)
      redirect_to toner_models_path, notice: "toner was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @toner_model.destroy
    redirect_to toner_models_path, notice: "toner was successfully destroyed."
  end

  private

  def set_toner_model_and_check_authorization
    @toner_model = TonerModel.find(params[:id])
    authorize @toner_model
  end

  def toner_model_params
    params[:toner_model].permit(:name, :laser, :vendor_id, printer_model_ids: [])
  end
end
