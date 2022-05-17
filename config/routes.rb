Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show edit update]
  resources :bank_accounts, only: %i[index new show edit update destroy]
  resources :categories, except: %i[show]
  resources :movements, only: %i[index]
end
