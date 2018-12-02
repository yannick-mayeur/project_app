Rails.application.routes.draw do
  devise_for :dusers
  get '/about',  to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',  to: 'cookies#new'
  post '/login',  to: 'cookies#create'
  delete '/logout', to: 'cookies#destroy'
  root 'static_pages#home'
  resources :users, only: [:edit, :update]
  resources :courses
  resources :followments, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :old_exams
  resources :account_activations, only: [:edit]
end
