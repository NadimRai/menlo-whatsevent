Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
    resources :users, only: [:index, :show]
    resources :categories
    resources :comments, only: [:index]
    resources :attendances, only: [:index]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    get 'registered',to: "users#registered"
  end

  resources :categories, only: [:show]
  resources :tags, only: [:show]

  resources :events do 
    resources :likes, only: [:create]
    resources :comments, only: [:create]
    resources :attendances, only: [:create]
  end
  get 'search', to: 'events#search'
  

  

  root "homes#index"
end
