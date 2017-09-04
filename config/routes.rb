Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :events

  root "events#index"
end
