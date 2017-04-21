Rails.application.routes.draw do

  resources :bands

  resource :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect("/bands")
end
