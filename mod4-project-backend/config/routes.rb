Rails.application.routes.draw do
  resources :accounts
  resources :banks
  resources :budgets
  resources :transactions
  resources :transaction_types
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
