class ReservationsController < ApplicationController
  
	def index
		@reservations = current_user.reservations
	end

  def show

  	@reservation = Reservation.find(params[:id])
  	@listing = @reservation.listing
  	@total_nights = (@reservation.end_date - @reservation.start_date).to_i
  	
  end

  def new 

  end

  def create

  	@reservation = current_user.reservations.new(reservation_params)
  	@listing = Listing.find(params[:reservation][:listing_id])
  	@host = @listing.user
  	@price = @listing.price
  	
		@total_nights = (params[:reservation][:end_date].to_date - params[:reservation][:start_date].to_date).to_i

  	@total_price = @price * @total_nights
  	@reservation.total_price = @total_price

    # @overlap = false
    # if @listing.reservations.empty? 
    #   @overlap = false
    # else @listing.reservations.each do |r|
    #     if Reservation.overlap?(r.start_date, r.end_date, @reservation.start_date, @reservation.end_date)
    #      @overlap = true
    #     end
    #   end
    # end

    # -----------
    overlap = Reservation.where('listing_id = ? AND start_date <= ? AND end_date >= ?', @listing.id, @reservation.end_date, @reservation.start_date)
    if overlap.empty?
      @reservation.save
      flash[:notice] = "Reservation successfully created! Enjoy your trip!"

      ReservationJob.set(wait: 1.minute).perform_later(current_user, @host, @reservation)

      redirect_to reservation_path(@reservation)

    else
      flash[:notice] = "This date range is unavailable!"
      redirect_to :back
    end
    # -------------

  	# if @overlap
   #    flash[:notice] = "This date range is unavailable!"
   #    redirect_to :back
   #  else
   #     @reservation.save
  	#    flash[:notice] = "Reservation successfully created! Enjoy your trip!"
  	#    redirect_to reservation_path(@reservation)
	  # end

  end

                                  

  private

  def reservation_params
  	params.require(:reservation).permit(:listing_id,:user_id,:start_date,:end_date, :head_count)
  end

end
