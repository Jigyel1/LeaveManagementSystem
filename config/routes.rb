Rails.application.routes.draw do
  resources :leavs do
    collection do
      get '/approve/:id', to: 'leavs#approve', as: 'approve'
      get '/reject/:id', to: 'leavs#reject', as: 'reject'
      get '/feedback/:id', to: 'leavs#feedback', as: 'feedback'
    end
  end
  get 'profile/index'
  devise_for :users
  root 'home#index'
  resources :users, path_names: {registration: 'register'}
end
