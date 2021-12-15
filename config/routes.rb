Rails.application.routes.draw do
  resources :users, only: [:create, :show]
  get "/user", to: 'users#user'
  post "login", to: 'authentication#login'
end
