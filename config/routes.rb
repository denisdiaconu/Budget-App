Rails.application.routes.draw do
  unauthenticated :user do
    root to: 'splash#index'
  end
  
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  
  resources :entities
  resources :groups
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
