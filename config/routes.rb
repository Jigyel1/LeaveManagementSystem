Rails.application.routes.draw do
  get 'profile/index'
  devise_for :users
  root 'home#index'
  resources :users
end
