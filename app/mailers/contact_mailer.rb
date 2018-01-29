class ContactMailer < ApplicationMailer
	default from: 'contact@content-market.co.uk'

	def send_mail(contact_name, contact_email, contact_message)
		@message = contact_message
    @name = contact_name
    @email = contact_email
		mail(to: 'hello@content-market.co.uk', subject: 'New Message From Contact Form')
	end
end
