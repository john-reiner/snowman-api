Rails.application.routes.draw do
  resources :bills
  resources :bills, only: [:create, :index, :show, :destroy, :update]
  resources :users, only: [:create, :show]
  get "/user", to: 'users#user'
  post "login", to: 'authentication#login'
end
