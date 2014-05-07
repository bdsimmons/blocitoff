Blocitoff::Application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :index, :update]

  get '/about' => "welcome#about"
  
  root to: 'welcome#index'

end
