Rails.application.routes.draw do
  root 'chat#index'
  resources :superadmin, only: [:index]

  match '/auth/google_oauth2/callback', to: 'sessions#create', via: [:all]
  resources :chat
  resources :sessions, only: [:create, :destroy]
  resource :user, only: [:update]
end
