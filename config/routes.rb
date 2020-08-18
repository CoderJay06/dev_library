Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/home', to: 'sessions#home'
  get '/logout', to: 'sessions#destroy'
  delete '/users/:id', to: 'sessions#destroy'
  resources :subscriptions
  resources :reviews
  resources :categories
  resources :books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
