class Listing < ActiveRecord::Base

	mount_uploaders :images, AvatarUploader
  belongs_to :user
  has_many :listing_amenities, :dependent => :destroy
  has_many :amenities, through: :listing_amenities
  has_many :reservations, :dependent => :destroy

	def self.search(search)
		word = "%#{search}%"
		where("country LIKE ?", word)
	end

end