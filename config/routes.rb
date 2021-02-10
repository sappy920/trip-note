Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :artcles, only: :index
end
