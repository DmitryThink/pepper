Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  post 'home/search'
  get 'home/new'
  get 'home/commented'
  resources :offers, only: [ :show ], :controller => :home
  resources :offers, only: [ :index, :create, :update ]
  resources :comments, only: [ :create, :destroy ]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
