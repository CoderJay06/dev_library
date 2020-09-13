Rails.application.routes.draw do
  root 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get'/logout', to: 'sessions#destroy'

  # Routes for google oauth
  get '/auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  get '/signup', to: 'users#new'
  get '/users/:id/delete', to: 'users#delete'
  delete '/users/:id', to: 'users#destroy', as: 'delete_account'
  get '/users/:id/reviews', to: 'reviews#show', as: 'user_reviews'
  post '/books/:id/downloads/:id', to: 'downloads#create' , as: 'download_book'
  get '/books/recently_added', to: 'books#recently_added'

  namespace :admin do 
    resources :categories, only: [:new, :create]
    resources :books, except: [:index, :show]
    resources :authors, only: [:new, :create, :destroy]
  end 

  resources :books do 
    resources :reviews
    resources :downloads
  end
  
  resources :books, only: [:index, :show, :recently_added]
  # resources :authors
  resources :users
  resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
