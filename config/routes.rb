Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  unauthenticated do
    root 'splash#splash', as: :unauthenticated_root
  end

  resources :users
  resources :groups, only: [:index, :new, :create, :destroy, :show] do
    resources :entities, only: [:new, :create, :destroy]
  end
end
