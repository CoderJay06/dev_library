Rails.application.routes.draw do
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get'/logout', to: 'sessions#destroy'

  # Routes for oauth
  get '/auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  get '/signup', to: 'users#new'
  get '/users/:id/delete', to: 'users#delete'
  delete '/users/:id', to: 'users#destroy', as: 'delete_account'
  get '/users/:id/reviews', to: 'reviews#show', as: 'user_reviews'
  post '/books/:id/downloads/:id', to: 'downloads#create' , as: 'download_book'
  get '/books/recently_added', to: 'books#recently_added'
  get '/search', to: 'searches#new'
  get '/admin/authors/:id/delete', to: 'admin/authors#delete', as: 'delete_author'
  delete '/admin/authors/:id', to: 'admin/authors#destroy'

  namespace :admin do 
    resources :categories, only: [:new, :create]
    resources :books, except: [:index, :show]
    resources :authors, except: [:index, :show]
  end 

  resources :books do 
    resources :reviews
    resources :downloads
  end
  
  resources :authors, only: [:index, :show]
  resources :users
  resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
