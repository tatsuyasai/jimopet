Rails.application.routes.draw do
  get 'pets/new'
  get 'sessions/new' 
  get 'pages/index'
  get 'pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index' #トップページ
  
  get 'users/index'
  resources :users
  
  get 'pets/index'
  resources :pets
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  
  get 'comments/new'
  resources :comments
end
