Rails.application.routes.draw do
  get '/login',to: "sessions#new"
  post '/login',to: "sessions#create"
  delete '/logout',to: "sessions#destroy"

  

  get '/home', to: "static_pages#home"
  get '/help', to: "static_pages#help"
  get '/about', to: "static_pages#about"
  get '/sign_up',to: "users#new"
  post '/sign_up',to: "users#create"


  resources :microposts
  resources :users
  root "static_pages#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
