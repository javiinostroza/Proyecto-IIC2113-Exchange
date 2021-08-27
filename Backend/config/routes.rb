Rails.application.routes.draw do
  scope :api do
    devise_for :users, skip: %i[registrations sessions passwords]
    devise_scope :user do
      post '/register', to: 'registrations#create'
      post '/login', to: 'sessions#create'
      post '/logout', to: 'sessions#destroy'
      post '/transactions', to: 'transactions#create'
      get  '/balances', to: 'balances#index'
      get  '/markets', to: 'markets#index'
      get  '/transactions', to: 'transactions#index'
      get  '/cryptocurrencies', to: 'cryptocurrencies#index'
      get  '/wallets', to: 'wallets#index'
    end

    resources :balances, only: :index
    resources :transactions, only: [:index, :create]
    resources :cryptocurrencies, only: [:index, :show]
    resources :wallets, only: :index
    resources :markets, only: :show
    resources :users
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
