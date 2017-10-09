Rails.application.routes.draw do

  root "posts#index"
  ##post routes
  get "/posts/search" => "posts#search"
  get "/mark_as_read" => "posts#mark_as_read"

  resources :posts, only: [:index]
  resources :users, only: [:create, ]
  resources :sessions, only: [:create, :destroy]

  get "/sign_in" => "sessions#new"
  get "/sign_in_partial" => "users#sign_in_partial"
  get "/sign_up_partial" => "users#sign_up_partial"
  post "/callbacks" => "users#callbacks"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
