Rails.application.routes.draw do

  root "main#index", as: :main

  resource :dashboard, only: [:show]

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update]

  resources :rants, only: [:create, :destroy]

end
