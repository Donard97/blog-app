# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/users', to: 'users#index'
get '/users/:id', to: 'users#show'
get '/users/:id/posts', to: 'posts#index'
get '/users/:id/posts/:id', to: 'posts#show'
end
