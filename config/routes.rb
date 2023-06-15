# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end

  get "/users/", to: "users#index", as: 'users_index'
  get "/users/:id", to: "users#show", as: 'user_show'
  get "/users/:id/posts", to: "posts#index", as: 'user_posts'
  get "/users/:user_id/posts/:post_id", to: "posts#show", as: 'user_post'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  post '/posts/new', to: 'posts#create', as: 'create_post'
  get '/comment/new/:post_id', to: 'comments#new', as: 'new_comment'
  post '/comment/new/:post_id', to: 'comments#create', as: 'create_comment'
  post '/likes/new', to: 'likes#create', as: 'create_like'

  # Defines the root path route ("/")
  # root "blog_entries#index"
  # root "articles#index"
end
