class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

	
	#validate :date
	validate :not_in_past
	validate :availability

	validates :party_size, :presence=>true, :numericality => {:only_integer=>true}
	

	private
	def availability
		if !restaurant.availability(party_size, party_time)
			errors.add(:base, "Sorry, restaurant is full for your party-size")
		end
	end


	def date
		t = party_time
		expectation = (t.month!="month" && t.day!="day" && t.hour!="hour")
		if !expectation
			errors.add(:base, "Please double check your reservation date and time")
		end
	end

	def not_in_past
		t = party_time
		n = DateTime.now
		expectation = (t.month >= n.month)
		
		if t.month == n.month
				expectation = t.day >= n.day
		end
	

		if !expectation
			errors.add(:base, "This reservation is in the past #{t.year}")
		end
	end


end
