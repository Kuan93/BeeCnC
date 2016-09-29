class HomeController < ApplicationController
  def index
  
  end

  def show
  end

  def search
  	@hash = { 
  		country: params[:country]
  	}

  	@hash_filled = @hash.compact

    @listings = Listing.search(params[:listing][:name], fields: ["name"], mispellings: {below: 5}, where: @hash_filled)
    if @listings.blank?
      redirect_to root_path, flash:{danger: "no successful search result"}
    else
      render :index
    end
  end

end