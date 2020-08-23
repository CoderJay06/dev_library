Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/home', to: 'sessions#home'
  get '/books/recently_added', to: 'books#recently_added'
  get '/books/:id/reviews/new', to: 'reviews#new'
  get '/books/:id/reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  post '/books/:id/reviews/new', to: 'reviews#create'
  patch '/books/:id/reviews/:id/edit', to: 'reviews#update'
  delete '/books/:id/reviews/:id', to: 'reviews#destroy', as: 'delete_review'
  patch '/books/:id', to: 'books#update'
  delete '/bookd/:id', to: 'books#destroy'
  delete '/logout', to: 'sessions#destroy'
  resources :books do 
    resources :reviews 
  end
  resources :subscriptions
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
