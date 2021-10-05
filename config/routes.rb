Rails.application.routes.draw do

  devise_for :users 
  resources :posts do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end
  resources :users, :only => [:index, :show]
  
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resources :maps 
  root 'posts#index'
  resources :relationships, only: [:create, :destroy] 
end
