# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end

  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:user_id/posts", to: "posts#index", as: 'user_posts'
  get "/users/:user_id/posts/:id", to: "posts#show", as: 'user_post'

  # Defines the root path route ("/")
  # root "blog_entries#index"
  # root "articles#index"
end
