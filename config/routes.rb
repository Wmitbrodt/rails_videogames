Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  resources :videogames
  
  root 'videogames#index'
end
