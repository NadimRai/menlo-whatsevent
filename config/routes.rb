Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
    resources :users, only: [:index, :show]
    resources :categories
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    get 'registered',to: "users#registered"
  end

  resources :categories, only: [:show]
  resources :events do 
    resources :comments
    resources :attendances, only: [:create]
  end
  get 'search', to: 'events#search'
  

  

  root "events#index"
end
