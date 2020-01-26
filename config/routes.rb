Rails.application.routes.draw do
  get 'tasks', to: 'tasks#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/users', to: 'users#new'
  resources 'users', only: ['show', 'new', 'create', 'destroy']
end
