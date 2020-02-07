Rails.application.routes.draw do
  get "sessions/new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home_page#index"
  resources :post
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/profile", to: "users#edit"
  get "/profile/:email", to: "users#show"
  resources :users
  resources :account_activations, only: [:edit]
  resources :microposts, only: [:create, :destroy]
end
