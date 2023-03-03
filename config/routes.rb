Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root "devise/sessions#new"

    # API endpoints for sign up
    post "/api/signup", to: "api/registrations#create"
  end

end
