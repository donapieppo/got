class PrintersController < ApplicationController
  before_action :set_printer, only: [:edit, :update, :show, :destroy]

  def new
    @printer = @current_organization.printers.new
    if params[:printer_model_id]
      @printer.printer_model = PrinterModel.find(params[:printer_model_id])
    else
      @printer.printer_model = PrinterModel.first
    end
  end

  def create
    @printer = @current_organization.printers.new(printer_params)
    if @printer.save
      redirect_to organization_path(@current_organization), notice: 'Printer was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @printer.update(printer_params)
      redirect_to organization_path(@current_organization), notice: 'La stampante è stata correttamente aggiornata.'
    else
      render :edit
    end
  end

  def destroy
    @printer.destroy
    redirect_to organization_path(@current_organization)
  end

  def show
  end

  private

  def set_printer
    @printer = @current_organization.printers.find(params[:id])
  end

  def printer_params
    params[:printer].permit(:name, :printer_model_id, :description)
  end
end

