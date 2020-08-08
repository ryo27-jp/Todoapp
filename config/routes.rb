Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'users/index'
  root to: 'todos#index'
  resources :todos
  resources :categories
  resources :users
end
