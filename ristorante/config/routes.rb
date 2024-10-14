Rails.application.routes.draw do
  resources :ingredients
  resources :broughts
  resources :tables
  resources :orders
  root 'home#index' 
end
