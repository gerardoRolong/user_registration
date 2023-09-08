Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :departments, only: :index
  resources :cities, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
