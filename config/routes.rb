Rails.application.routes.draw do
  root 'welcome#index'

  match '/auth/google_oauth2/callback', to: 'sessions#create', via: [:all]

  resources :chat, only: [:index, :create, :show]
  resources :sessions, only: [:create, :destroy]
end
