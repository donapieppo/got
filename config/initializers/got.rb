CESIA_UPN = [ 'pietro.donatini@unibo.it', 
              'mariateresa.bettazzi@unibo.it',
              'valeria.montesi3@unibo.it',
              'valeria.montesi4@unibo.it' ]

module Got
  class Application < Rails::Application
    config.dm_common = {
      login_method: :log_if_email,
      message_footer: %Q{Messaggio inviato da 'Game of Toner'.\nNon rispondere a questo messaggio.\nPer problemi tecnici contattare dipmat-supportoweb@unibo.it},
      impersonate_admins:  ['pietro.donatini@unibo.it', 'valeria.montesi3@unibo.it', 'valeria.montesi4@unibo.it'],
      interceptor_mails:   ['donatini@dm.unibo.it'],
      main_impersonations: ['a.barbieri@unibo.it', 'giorgio.bolondi@unibo.it', 'enrica.zanelli@unibo.it', 'valerio.velino2@unibo.it', 'mirko.ravaioli@unibo.it'] }
    
  end
end


# Triennali Informatica per il management (CS M triennale)
# 8014 Informatica per il Management
# 0100 Scienze di Internet (D.M. 509/99)
#
# Magistrali Informatica per il Management (CS M magistrale)
# 8031 Scienze di Internet
# 0440 Scienze di Internet (D.M. 509/99)
#
# Triennali Informatica (CS triennale)
# 0099 Informatica (D.M. 509/99) 
# 8009 Informatica
# 0101 Scienze dell'informazione (D.M. 509/99)
#
# Magistrali/Quinquennali/Quadriennali Informatica (CS magistrale)
# 0245 Informatica LS (D.M. 509/99) 
# 1617 Scienze dell’Informazione (ante D.M.509/99)
# 1674 Informatica (ante D.M.509/99)
# 8028 Informatica
# 0246 (è di Cesena, possiamo eliminarla)

