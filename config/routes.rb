Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :quize_data
  get "/login", to: "users#login"
  post  "/sign_up", to: "users#signup"
  post "submit_quize", to: "quize_data#submit"
end
