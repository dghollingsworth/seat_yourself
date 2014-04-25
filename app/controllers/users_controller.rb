class UsersController < ApplicationController
  before_filter :load_restaurants 
  before_filter :ensure_logged_in, :only=>[:profile]
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		redirect_to restaurants_url, :notice=>"Signed Up!"
  	else
  		render "new"
  	end
  end

  
  def profile
    @user = current_user
  end

  private

  def user_params
  	params.require(:user).permit(:user_type, :name, :telephone, :email, :password, :password_confirmation)
  end

  def load_restaurants
    @restaurant = Restaurant.all
  end

end
