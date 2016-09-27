class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(current_user,host,reservation)
    # Do something later
    Usermailer.booking_email(current_user, host, reservation).deliver_now
  end
end
