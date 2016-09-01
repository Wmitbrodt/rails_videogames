Rails.application.routes.draw do

  devise_for :users

  resources :videogames do 
  	resources :reviews, except: [:show, :index] # creates a nested resource for reviews; reviews not on videogame pages
  end

  root 'videogames#index'
end
