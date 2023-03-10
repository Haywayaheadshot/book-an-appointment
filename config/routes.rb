Rails.application.routes.draw do
  resources :doctors_reservations
  resources :reservations
  # namespace :api do
  #   get 'doctors/index'
  # end

  namespace :api do
    resources :reservations, only: [:create, :index]
    resources :doctors, only: [:index]
    resources :users, only: [:index]
  end
  # resources :doctors
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root "devise/sessions#new"

    # API endpoint for sign up
    post "/api/signup", to: "api/registrations#create"

    # API endpoint for log in
    post "/api/login", to: "api/sessions#new"
  end

end
