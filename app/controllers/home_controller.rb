class HomeController < ApplicationController
  def index
    authorize :home
    if false && current_user.is_cesia?
      redirect_to organizations_path and return
    elsif current_organization && policy(current_organization).show?
      #  
    else
      redirect_to choose_organization_path and return
    end
  end

  def search
    authorize :home
    if params[:search_string].size > 1 
      s = "%" + params[:search_string].strip + "%"
      @vendors = Vendor.where('vendors.name LIKE ?', s)
      @printer_models = PrinterModel.where('printer_models.name LIKE ?', s) + PrinterModel.where(vendor: @vendors)
      @toner_models   = TonerModel.where('toner_models.name LIKE ?', s) + TonerModel.where(vendor: @vendors)
    else
      redirect_to root_path, alert: t(:please_refine)
    end
  end

  def report
    printable = Printable.new(t :pdf_report_title)
    printable.toners
    pdf_output(printable)
  end

  def choose_organization
    authorize :home
  end
end
