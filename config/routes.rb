Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logiut', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end

  root to: 'tasks#index'
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end