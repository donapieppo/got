require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Got
  class Application < Rails::Application
    config.autoload_paths << "#{Rails.root}/app/pdfs"
    config.time_zone = "Rome"

    config.load_defaults 7.0

    config.i18n.default_locale = :it

    config.authlevels = {read: 1, manage: 2}

    config.action_mailer.default_url_options = {protocol: "https"}
    config.dm_unibo_common = ActiveSupport::HashWithIndifferentAccess.new config_for(:dm_unibo_common)

  end
end
