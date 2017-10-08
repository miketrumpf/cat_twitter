Rails.application.routes.draw do

  root "posts#index"
  get "/posts/search" => "posts#search"

  resources :posts
  resources :users
  get "/sign_in" => "sessions#new"
  post "/callbacks" => "users#callbacks"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
