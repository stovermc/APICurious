Rails.application.routes.draw do

  root 'home#index'
  get '/auth/github',          as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout',            to: 'sessions#destroy'

  # resources :dashboard, only: [:index]
  get '/dashboard',            to: 'dashboard#index'
  get '/dashboard/followers',   to: 'followers#index'

end
