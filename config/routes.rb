Rails.application.routes.draw do
  root to: 'groups#index'
  resources :entities
  resources :groups
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
