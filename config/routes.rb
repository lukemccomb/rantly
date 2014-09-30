Rails.application.routes.draw do

  root "main#index", as: :main

  get "signin" => "sessions#new", as: :login

  post "signin" => "sessions#create"

  get "register" => "users#new", as: :register

  post "register" => "register#create"

  resources :users

end
