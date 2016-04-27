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
      @printer_models = PrinterModel.where('printer_models.name LIKE ?', "%" + params[:search_string] + "%")
      @toner_models = TonerModel.where('toner_models.name LIKE ?', "%" + params[:search_string] + "%")  
    else
      redirect_to root_path, alert: 'Raffinare la ricerca'
    end
  end
  
end


