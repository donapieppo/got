class HomeController < ApplicationController

  def index
    if current_user.is_cesia?
      redirect_to organizations_path
    else
      redirect_to organization_path(@current_organization)
    end
  end

  def search
    if params[:search_string].size > 1 
      s = "%" + params[:search_string].strip + "%"
      @vendors = Vendor.where('vendors.name LIKE ?', s)
      @printer_models = PrinterModel.where('printer_models.name LIKE ?', s) + PrinterModel.where(vendor: @vendors)
      @toner_models   = TonerModel.where('toner_models.name LIKE ?', s) + TonerModel.where(vendor: @vendors)
    else
      redirect_to root_path, alert: t(:please_refine)
    end
  end
  
end


