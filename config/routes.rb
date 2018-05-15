Rails.application.routes.draw do
  resources :courses
  resources :exams
  root 'application#hello'
end
