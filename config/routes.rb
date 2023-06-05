Rails.application.routes.draw do
  devise_for :users
  root 'group#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :groups, only: [:index, :new, :create, :destroy] 
end
