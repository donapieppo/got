class HelpsController < ApplicationController

  def index
    @organizations = Organization.order(:name)
    authorize :help
  end

end


