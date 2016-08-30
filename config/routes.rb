Rails.application.routes.draw do
  devise_for :users
  resources :videogames
  
  root 'videogames#index'
end
