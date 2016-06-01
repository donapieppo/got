# superusers of the application got
# can manage/create organizations and add the first admin
# to every organization
CESIA_UPN = [ 'name.surname@unibo.it', 'name2.surname2@unibo.it' ]

module Got
  class Application < Rails::Application
    config.domain_name = 'unibo.it'
    config.dm_common = {
      omniauth_provider: :google_oauth2,
      login_method: :log_if_email, # can use application only if present in database
      message_footer: %Q{Messaggio inviato da 'Game of Toners'.\nNon rispondere a questo messaggio.\nPer problemi tecnici contattare got-support@unibo.it},       # mailer 
      impersonate_admins:  ['name.surname@unibo.it'], # who can impersonate. See https://github.com/ankane/pretender
      interceptor_mails:   ['name@example.com'],
      main_impersonations: [] }
  end
end

