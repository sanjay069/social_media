Rails.application.routes.draw do
  resources :friends
  post "/users", to: "users#create"
  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
  resources :friends do
    resources :likes
  end  
end