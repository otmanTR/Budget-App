Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :groups, only: [:index, :new, :create, :destroy] do
    resources :entities, only: [:index, :new, :create, :destroy]
  end
end
