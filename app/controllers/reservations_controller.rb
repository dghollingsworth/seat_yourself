class ReservationsController < ApplicationController
	before_filter :load_restaurant

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = @restaurant.reviews.build(reservation_params)
  	@reservation.user_id = current_user.id
  	@reservation.restaurant_id = @restaurant.id

  	if @reservation.save
  		redirect_to reservation_path(reservation)
  	else
  		render :new
  	end
  end


  def edit
  end

	def update
	end  

	def destroy
	end

	private
	def reservation_params
		params.require(:reservation).permit(:party_size, :party_time)
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end
