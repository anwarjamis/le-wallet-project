Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show]
  resources :bank_accounts do
    get "movements", to: "movements#bank_movements"
  end
  resources :categories, except: %i[show]
  resources :movements, only: %i[index]
  get "statistics", to: "movements#statistics"
end
