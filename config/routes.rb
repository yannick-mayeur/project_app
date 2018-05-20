Rails.application.routes.draw do
  get '/about',  to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',  to: 'cookies#new'
  post '/login',  to: 'cookies#create'
  delete '/logout', to: 'cookies#destroy'
  root 'static_pages#home'
  resources :users
  resources :courses
end
