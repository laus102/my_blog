Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  get :token, controller: 'application'
end

