Rails.application.routes.draw do

  root "posts#index"
  get "/posts/search" => "posts#search"

  resources :posts
  resources :users
  resources :sessions, only: [:create, :destroy]

  get "/sign_in" => "sessions#new"
  get "/sign_in_partial" => "users#sign_in_partial"
  get "/sign_up_partial" => "users#sign_up_partial"
  post "/callbacks" => "users#callbacks"
  post "/mark_as_read" => "posts#mark_as_read"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
