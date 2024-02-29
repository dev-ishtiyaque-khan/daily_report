# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  get '/products/:id', to: 'products#show', as: 'product'
  root "orders#index"
end
