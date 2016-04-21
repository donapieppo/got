class PrintersController < ApplicationController
  before_action :set_organization_and_check_permission

  def new
    @printer = @organization.printers.new
    # json from vendor id => array di models
    @from_vendor_to_models = PrinterModel.order(:name).inject(Hash.new {|hash, key| hash[key] = []}){|res, p| res[p.vendor_id] << [p.id, p.name]; res}.to_json
  end

  def create
    @printer = @organization.printers.new(printer_params)
    if @printer.save
      redirect_to organization_path(@organization), notice: 'Printer was successfully created.'
    else
      render :new
    end
  end

  private

  def set_organization_and_check_permission
    @organization = Organization.find(params[:organization_id])
  end

  def printer_params
    params[:printer].permit(:name, :printer_model_id, :url, :description)
  end
end

