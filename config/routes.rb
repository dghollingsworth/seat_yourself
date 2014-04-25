SeatYourself::Application.routes.draw do

	resources :sessions, :only=>[:new, :create, :destroy]
  
  resources :users, :except=>[:index] do
  	get 'profile', on: :collection, as: "profile"
  end

  resources :restaurants do
  	resources :reservations, :except=>[:index]	
  end

end
