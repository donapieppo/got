class NotificationMailer < ActionMailer::Base
  default from: 'noreply-got@dm.unibo.it'
  layout 'mailer'

  def notify_organization(organization, gifts_array)
    @organization = organization
    @gifts_array = gifts_array

    mail(to: 'donatini@dm.unibo.it', subject: 'Got: Toner disponibili')
  end
end
