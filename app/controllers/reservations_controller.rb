class ReservationsController < ApplicationController
	before_filter :load_restaurant
  before_filter :ensure_logged_in
  
  def show
  	@reservation = Reservation.find(params[:id])
  end

  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = @restaurant.reservations.build(reservation_params)
  	@reservation.user_id = current_user.id

  	if @reservation.save
      redirect_to profile_users_path, :notice=>"Reservation made!!!"
    else
  		render :new
  	end
  end


  def edit
    @reservation = Reservation.find(params[:id])
  end

	def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to profile_users_path
    else
      render :edit
    end
	end  

	def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to profile_users_path
	end

	private
	def reservation_params
		params.require(:reservation).permit(:party_size, :party_time)
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

end
