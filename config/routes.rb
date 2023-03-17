Rails.application.routes.draw do
  resources :doctors_reservations
  resources :reservations
  
  namespace :api do
    resources :reservations, only: [:create, :index]
    resources :doctors, only: [:index, :show, :create, :update, :destroy]
    resources :users, only: [:index]
  end

  devise_for :users
  resources :users

  devise_scope :user do
    root "devise/sessions#new"

    # API endpoint for sign up
    post "/api/signup", to: "api/registrations#create"

    # API endpoint for log in
    post "/api/login", to: "api/sessions#new"
  end
end
