class Usermailer < ApplicationMailer

	default from: 'ads7143@gmail.com'

	def booking_email(customer, host, reservation)
		@user = customer
		@host = host
		@reservation = reservation
		@url = 'http://localhost:3000/reservations/' + @reservation.id.to_s
		@confirmation_url 
		mail(to: @host.email, subject: 'New Reservation Request!')
	end

	# https://www.google.com/settings/security/lesssecureapps

end
