Rails.application.routes.draw do
  root 'sessions#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/home', to: 'sessions#home'
  get'/logout', to: 'sessions#destroy'

  
  # Routes for google oauth
  get '/auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  get '/signup', to: 'users#new'
  get '/users/:id/delete', to: 'users#delete'
  delete '/users/:id', to: 'users#destroy', as: 'delete_account'
  get '/users/:id/reviews', to: 'reviews#show', as: 'user_reviews'
  delete '/books/:id/reviews/:id', to: 'reviews#destroy', as: 'delete_review'
  post '/books/:id/downloads/:id', to: 'downloads#create' 
  get '/books/recently_added', to: 'books#recently_added'

  resources :books do 
    resources :reviews, except: [:destroy]
    resources :downloads
  end
  resources :books
  resources :users, except: [:destroy]
  resources :categories, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
