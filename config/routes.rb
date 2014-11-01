Rails.application.routes.draw do

  root "main#index", as: :main

  resource :dashboard, only: [:show]

  resource :admin_dashboard, only: [:show]

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:index, :new, :create, :edit, :update, :show] do
    get 'following' => 'following_relationships#show'
    get 'favorites' =>  'favorites#show'
    post 'follow' => 'following_relationships#create'
    post 'unfollow' => 'following_relationships#destroy'
  end

  resource :search, only: [:new, :show]
  resources :hashtags, only: [:show]

  resources :rants, only: [:index, :create, :destroy, :show] do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end
