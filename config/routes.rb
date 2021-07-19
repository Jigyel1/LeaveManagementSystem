Rails.application.routes.draw do
  resources :notifications do
    collection do
      get '/mark_read', to: 'notifications#mark_as_read', as: "read"
    end
  end
  resources :leavs do
    collection do
      get '/approve/:id', to: 'leavs#approve', as: 'approve'
      get '/reject/:id', to: 'leavs#reject', as: 'reject'
      get '/feedback/:id', to: 'leavs#feedback', as: 'feedback'
      get '/approved_leaves', to: 'leavs#approved_leaves'
      get '/rejected_leaves', to: 'leavs#rejected_leaves'
    end
  end
  get 'profile/index'
  devise_for :users
  resources :guides
  root 'home#index'
  resources :users do
    collection do
      post 'users/new/create', to: 'users#create', as: 'users_create'
    end
  end
end
