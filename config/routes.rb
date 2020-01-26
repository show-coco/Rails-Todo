Rails.application.routes.draw do
  get 'tasks', to: 'tasks#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources 'users', only: ['show', 'new', 'create', 'destroy']
end
