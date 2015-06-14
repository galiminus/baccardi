Rails.application.routes.draw do
  post "/users/auth/google", controller: :users, action: "google"

  resources :users, defaults: { format: :json } do
    resources :projections
  end
end
