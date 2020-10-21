Rails.application.routes.draw do
  resources :address_converters
  resources :accounts
  resources :banks
  resources :budgets
  resources :transaction_types
  resources :transactions
  resources :categories
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/get_link_token', to: 'users#link_token'
  post '/get_access_token', to: 'users#access_token'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
