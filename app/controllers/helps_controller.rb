class HelpsController < ApplicationController

  def index
    @organizations = Organization.order(:name)
  end

end


