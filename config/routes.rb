Rails.application.routes.draw do
  root to: 'music#index', via: :get
  resources :music, only: [:index,:new,:create]
end
