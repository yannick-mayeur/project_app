Rails.application.routes.draw do
  resources :exams
  root 'application#hello'
end
