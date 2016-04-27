CESIA_UPN = [ 'pietro.donatini@unibo.it', 'valeria.montesi4@unibo.it' ]

module Got
  class Application < Rails::Application
    config.dm_common = {
      login_method: :log_if_email,
      message_footer: %Q{Messaggio inviato da 'Game of Toner'.\nNon rispondere a questo messaggio.\nPer problemi tecnici contattare dipmat-supportoweb@unibo.it},
      impersonate_admins:  ['pietro.donatini@unibo.it', 'valeria.montesi4@unibo.it'],
      interceptor_mails:   ['donatini@dm.unibo.it'],
      main_impersonations: [] }
  end
end

