Rails.application.routes.draw do

  root 'home#index'
  get '/auth/github',          as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout',            to: 'sessions#destroy'

  get '/dashboard',            to: 'dashboard#index'
  get '/dashboard/followers',   to: 'followers#index'
  get '/dashboard/following',   to: 'following#index'
  
end
