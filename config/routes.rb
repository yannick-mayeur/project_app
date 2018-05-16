Rails.application.routes.draw do
  get '/about', to: 'static_pages#about'
  root 'static_pages#home'
end
