class PrinterModelsController < ApplicationController
  before_action :set_printer_model, only: [:show, :edit, :update, :destroy]

  def index
    @printer_models = PrinterModel.all
  end

  # remote
  def show
    @compatible_toners = @printer_model.toner_models
    @available_toners = Toner.where(gift: true).where(toner_model: @printer_model.toner_model_ids)
  end

  def new
    @printer_model = PrinterModel.new(laser: true, vendor_id: params[:vendor_id])
  end

  def edit
  end

  def create
    vendor = Vendor.find(params[:printer_model][:vendor_id])

    params[:printer_model][:name].split(';').each do |name|
      @printer_model = PrinterModel.new(name: name.strip, vendor_id: vendor.id, laser: params[:printer_model][:laser])
      if ! @printer_model.save
        render :new
      end
    end
    redirect_to printer_models_path, notice: 'La stampante èstata creata.'
  end

  def update
    if @printer_model.update(printer_model_params)
      redirect_to printer_models_path, notice: 'Printer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @printer_model.destroy
    redirect_to printer_models_path, notice: 'Printer was successfully destroyed.'
  end

  private
    def set_printer_model
      @printer_model = PrinterModel.find(params[:id])
    end

    def printer_model_params
      params[:printer_model].permit(:name, :laser, :vendor_id)
    end
end
