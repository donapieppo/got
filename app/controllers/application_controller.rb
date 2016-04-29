class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include DmCommon::Controllers::Helpers

  impersonates :user

  before_filter :log_current_user, :force_sso_user, :retrive_authlevel

  def retrive_authlevel
    @current_organization = current_user.organizations.first or raise DmCommon::NoAccess
    @available_organizations = current_user.organizations
  end

end
