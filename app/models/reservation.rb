class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

	# def self.overlap?(start_1, end_1, start_2, end_2)

	# 	(start_1 <= end_2 ) && (start_2 <= end_1)
	
	# end

end




