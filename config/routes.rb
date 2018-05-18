Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/about',  to: 'static_pages#about'
  post '/signup', to: 'users#create'
  root 'static_pages#home'
end
