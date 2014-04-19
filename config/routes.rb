SeatYourself::Application.routes.draw do

	resources :sessions, :only=>[:new, :create, :destroy]
  
  resources :users, :except=>[:index]

  resources :restaurants do
  	resources :reservations, :except=>[:index]	
  end

end
