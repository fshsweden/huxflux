Rails.application.routes.draw do
  
  root to: 'visitors#index'
  devise_for :users
  resources :users do
  	resources :lists do
  		resources :targets
  	end
  end

end
