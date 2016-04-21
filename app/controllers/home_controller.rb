class HomeController < ApplicationController

  def index
    if current_user.is_cesia?
      redirect_to organizations_path
    else
      redirect_to organization_path(@current_organization)
    end
  end
  
end


