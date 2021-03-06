class NotificationMailer < ApplicationMailer

  def notify_organization(organization, gifts_array)
    @organization = organization
    @gifts_array = gifts_array

    mail(to:      organization.admins_mail_array, 
         subject: 'Got: avviso di toner disponibili presso altre strutture.')
  end
end
