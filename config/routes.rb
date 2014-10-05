Rails.application.routes.draw do

  root "main#index", as: :main

  get "/dashboard" => "dashboard#dashboard"

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update] do

    resources :rants

  end



end
