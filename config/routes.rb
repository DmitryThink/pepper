Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  get 'home/index/:page', to: 'home#index'
  get 'home/new/:page', to: 'home#new'
  get 'home/commented/:page', to: 'home#commented'
  get 'home/by_user/:page', to: "home#by_user"
  post 'home/search'
  get 'home/new'
  get 'home/commented'
  get 'home/by_user'
  resources :offers, only: [ :show ], :controller => :home
  resources :offers, only: [ :index, :create, :update ]
  resources :comments, only: [ :create, :destroy ]
  resources :tags, only: [ :index, :show, :destroy ]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
