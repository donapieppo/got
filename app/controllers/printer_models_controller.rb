class PrinterModelsController < ApplicationController
  before_action :set_printer_model, only: [:show, :edit, :update, :destroy]

  def index
    @printer_models = PrinterModel.all
  end

  def new
    @printer_model = PrinterModel.new(laser: true, vendor_id: params[:vendor_id])
  end

  def edit
  end

  def create
    @printer_model = PrinterModel.new(printer_model_params)
    if @printer_model.save
      redirect_to printer_models_path, notice: 'Printer was successfully created.'
    else
      render :new
    end
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
