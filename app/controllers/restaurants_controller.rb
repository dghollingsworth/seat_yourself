class RestaurantsController < ApplicationController
  before_filter :ensure_logged_in, :except=>[:index]
  before_filter :ensure_owner, :except=>[:index]

  def index
  	@restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.update_attributes(restaurant_params)
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :capacity)
  end
end
