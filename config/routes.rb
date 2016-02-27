Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  root to: 'home#index', via: :get
  resources :music, only: [:index,:new,:create]
end
