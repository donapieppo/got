class ApplicationController < DmUniboCommon::ApplicationController
  before_action :set_current_user,
    :update_authorization,
    :set_current_organization,
    :after_current_user_and_organization,
    :log_current_user,
    :force_sso_user,
    :set_locale

  def pdf_output(printable)
    send_data printable.render, filename: printable.filename, type: "application/pdf", disposition: "inline"
  end

  def set_locale
    # session[:locale] = params[:locale] if params[:locale]
    # I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    I18n.locale = :it
  end
end
