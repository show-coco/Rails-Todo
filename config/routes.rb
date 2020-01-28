Rails.application.routes.draw do
  root 'sessions#new'
  get 'tasks/:id', to: 'tasks#index', as: 'tasks'
  post 'tasks/:status', to: 'tasks#create'
  patch 'tasks/:id', to: 'tasks#update'
  delete 'tasks/:id', to: 'tasks#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/users', to: 'users#new'
  resources 'users', only: ['edit', 'update', 'new', 'create', 'destroy']
end
