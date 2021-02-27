Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'toppages#index'
  resources :articles, only: [:index, :new, :create, :show, :destroy, :edit]
  resources :users, only: [:show, :edit]
end
