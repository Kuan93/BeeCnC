# Preview all emails at http://localhost:3000/rails/mailers/usermailer
class UsermailerPreview < ActionMailer::Preview

	def booking_email_preview
		Usermailer.booking_email(User.last, User.last, Reservation.last)
		 
	end

end
