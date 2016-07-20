class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DmUniboCommon::Controllers::Helpers

  impersonates :user

  before_filter :log_current_user, :force_sso_user, :retrive_authlevel

  def retrive_authlevel
    @available_organizations = current_user.organizations.all

    if @available_organizations.empty?
      redirect_to new_subscription_path and return
    end

    @current_organization = @available_organizations.first
  end

  def pdf_output(printable)
    send_data printable.render, filename: printable.filename, type: 'application/pdf', disposition: 'inline'
  end

end
