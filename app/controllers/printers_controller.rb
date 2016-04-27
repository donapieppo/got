class PrintersController < ApplicationController
  before_action :set_printer, only: [:edit, :update, :destroy]

  def new
    @printer = @current_organization.printers.new
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
    render :new
  end

  def destroy
    @printer.destroy
    redirect_to organization_path(@current_organization)
  end

  private

  def set_printer
    @printer = @current_organization.printers.find(params[:id])
  end

  def printer_params
    params[:printer].permit(:name, :printer_model_id, :url, :description)
  end
end

