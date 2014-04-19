class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

	validate :availability

	private
	def availability
		if !restaurant.availability(party_size, party_time)
			errors.add(:base, "Sorry, restaurant is full for your party-size")
		end
	end
end
