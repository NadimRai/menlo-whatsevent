Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
    resources :users, only: [:index, :show]
    resources :categories
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :categories, only: [:show]
  resources :events do 
    resources :comments
  end
  get 'search', to: 'events#search'

  

  root "events#index"
end
