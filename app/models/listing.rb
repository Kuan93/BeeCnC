class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_amenities, :dependent => :destroy
  has_many :amenities, through: :listing_amenities
end
