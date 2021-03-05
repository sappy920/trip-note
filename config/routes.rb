Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'toppages#index'

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
end
