Rails.application.routes.draw do

  root "main#index", as: :main

  get "signin" => "sessions#new", as: :login

  post "signin" => "sessions#create"

  get "register" => "registration#new", as: :register

  post "register" => "register#create"

end
