Rails.application.routes.draw do
  resources :follows
  resources :posts
  resources :rooms do
    resources :messages
  end
  root "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
                       sesions: "users/sessions",
                       registrations: "users/registrations",
                     }
  get "user/:id", to: "users#show", as: "user"
  get "/search", to: "pages#search"
  get "/request_list", to: "follows#request"
  get "/send_friend_request", to: "follows#send_friend_request"
  get "/accept_friend_request", to: "follows#send_friend_request"
  get "/delete_friend_request", to: "follows#delete_friend_request"
  get "/cancel_friend_request", to: "follows#cancel_friend_request"
  get "/profile", to: "users#profile"
  # Defines the root path route ("/")
  # root "articles#index"
end
