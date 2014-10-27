Rails.application.routes.draw do

  root "main#index", as: :main

  resource :dashboard, only: [:show]

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update, :show] do
    get 'following' => 'following_relationships#show'
    get 'favorites' =>  'favorites#show'
    post 'follow' => 'following_relationships#create'
    post 'unfollow' => 'following_relationships#destroy'
  end


  resources :rants, only: [:create, :destroy, :show] do
    resources :favorites, only: [:create, :destroy]
  end

end
