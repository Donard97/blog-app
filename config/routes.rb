# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create, :destroy] do
  end

  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:index] do
      resources :comments, only: [:create, :index]
    end
  end
end
