Rails.application.routes.draw do
  devise_for :users
  root to: 'toppages#index'
  resources :articles, only: [:index, :new, :create]
end
