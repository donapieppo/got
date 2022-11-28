class PrintersController < ApplicationController
  before_action :set_printer_and_check_permission, only: [:edit, :update, :show, :destroy]

  def show
    render layout: nil if modal_page
  end

  def new
    @printer = current_organization.printers.new(name: Rails.configuration.domain_name)
    authorize @printer
    if params[:printer_model_id]
      @printer.printer_model = PrinterModel.find(params[:printer_model_id])
    else
      @printer.printer_model = PrinterModel.first
    end
  end

  def create
    @printer = current_organization.printers.new(printer_params)
    authorize @printer
    if @printer.save
      redirect_to current_organization_root_path, notice: 'Printer was successfully created.'
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @printer.update(printer_params)
      redirect_to current_organization_root_path, notice: 'La stampante è stata correttamente aggiornata.'
    else
      render :edit
    end
  end

  def destroy
    @printer.destroy
    redirect_to current_organization_root_path
  end

  private

  def set_printer_and_check_permission
    @printer = current_organization.printers.find(params[:id])
    authorize @printer
  end

  def printer_params
    params[:printer].permit(:name, :printer_model_id, :description, :rent)
  end
end

