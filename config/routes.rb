Rails.application.routes.draw do
  root to: "home#index"

  post "/users/auth/google", controller: :users, action: "google"

  resources :users, defaults: { format: :json } do
    resources :projections
  end
end
