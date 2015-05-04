Rails.application.routes.draw do
  root to: "home#index"

  post "/users/auth/google", controller: :users, action: "google"

  resources :users
  resources :projections
end
