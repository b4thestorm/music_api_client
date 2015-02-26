Rails.application.routes.draw do
  root to: 'music#index'
  resources :music, only: [:index,:new,:create]
end
