# frozen_string_literal: true

Rails.application.routes.draw do
  # Static Pages
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'contact', to: 'static_pages#contact'
  get 'about', to: 'static_pages#about'

  # Registraition
  get 'signup', to: 'users#new'

  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Resources Users
  resources :users
end
