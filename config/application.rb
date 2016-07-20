require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Got
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/app/pdfs)
    config.time_zone = 'Rome'
    config.i18n.default_locale = :it

    config.action_mailer.default_url_options = { protocol: 'https' }
    config.dm_unibo_common = ActiveSupport::HashWithIndifferentAccess.new config_for(:dm_unibo_common)
  end
end


