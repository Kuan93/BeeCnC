class Amenity < ActiveRecord::Base
	belongs_to :user
	has_many :listings
	has_many :listings_amenities
	has_many :listings, through: :listings_amenities
end
