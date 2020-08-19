Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/home', to: 'sessions#home'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete '/bookd/:id', to: 'books#destroy'
  delete '/logout', to: 'sessions#destroy'
  resources :subscriptions
  resources :reviews
  resources :categories
  resources :books
  resources :users
  root 'sessions#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
