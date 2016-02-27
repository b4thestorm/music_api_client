Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create] do 
    resources :playlist do 
      resources :music, only: [:index,:new,:create] 
    end
  end
  root to: 'home#index', via: :get
  
end
