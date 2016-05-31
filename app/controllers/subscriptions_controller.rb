class SubscriptionsController < ApplicationController
  skip_filter :retrive_authlevel

  def new
    @organizations = Organization.includes(admins: :user).order('organizations.name').all
  end

  def create
    @organization = Organization.find(params[:oid])
    if @organization.admins.empty?
      @admin = @organization.admins.create(user_id: current_user.id)
    else
      redirect_to new_subscription_path, alert: 'La struttura selezionata possiede già amministratori. Contattarli per avere accesso'
    end
  end
  
end


