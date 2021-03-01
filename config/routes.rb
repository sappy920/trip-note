Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'toppages#index'
  resources :articles do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit]
end
