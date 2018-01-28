class ContactMailer < ApplicationMailer
	default from: 'contact@content-market.co.uk'

	def contact_email(message)
		@message = message
		mail(to: 'hello@content-market.co.uk')
	end
end
