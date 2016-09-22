require 'omniauth-google-oauth2'

# CESIA are superusers of the application who
# can manage/create organizations and add the first admin
# to every organization
CESIA_UPN = [ 'name.surname@unibo.it', 'name2.surname2@unibo.it' ]

module Got
  class Application < Rails::Application
    config.domain_name = 'example.com'

    config.header_title    = 'Game of Toners'
    config.header_subtitle = 'Gestione toner dismessi'
    config.header_icon     = 'tint'

    config.dm_unibo_common.update(
      login_method:        :log_if_email,                # can use application only if present in database
      impersonate_admins:  ['name.surname@example.com'], # who can impersonate. See https://github.com/ankane/pretender
      interceptor_mails:   ['name@example.com'],         # who gets emails in development
      main_impersonations: [],                           # suggested impersonation users
      message_footer:      %Q{Message sent from 'Game of Toners'.\nDo not reply}, # footer in all mail
      support_mail:        'example-supportweb@example.com' 
    )
  end
end

