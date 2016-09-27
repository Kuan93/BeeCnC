class ListingsController < ApplicationController
  
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @listings = @user.listings
  end

  def new
    @user = User.find(params[:user_id])
    @listing = Listing.new
  end

  def create
    @user = User.find(params[:user_id])
    @listing = @user.listings.new(listing_params)

    if @listing.save
      redirect_to user_listing_path(@user, @listing) and return
      # redirect_to [@user, @listing]
    else
      render 'new'
    end
  end

  def show
    @reservation = Reservation.new
    @images = @listing.images
  end

  def edit

  end

  def update

    if @listing.update(listing_params)
      redirect_to user_listing_path(current_user,@listing)
    else
      render 'edit'
    end
  end

  def destroy
    if @listing.destroy
      redirect_to user_listings_path(current_user)
    else
      render 'show'
    end 
  end

  def instruction
     @user = User.find(current_user.id)
  end

  def search
    @listings = Listing.all 
    if params[:search]
      @listings = Listing.search(params[:search]).order(created_at: :DESC) 
    else 
      @listings = Listing.all.order(created_at: :DESC)
    end  
  end

end

private

  def listing_params
    params.require(:listing).permit(:name, :country, :city, :address, :room_type, :room_number, :price, :check_in, :check_out, {:amenity_ids => []}, {images: []}, :remove_images)
  end

  def find_list
    @listing = Listing.find(params[:id])
  end