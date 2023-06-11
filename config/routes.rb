Rails.application.routes.draw do
  #Admins
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #Users
  devise_for :users
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :batches, only: [:index, :show] do
        get :join, on: :member
      end
    end
  end
  
  resources :batches, only: :show do
    get :join, on: :member
  end
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'

  # Defines the root path route ("/")
  root to: "home#index"
end
