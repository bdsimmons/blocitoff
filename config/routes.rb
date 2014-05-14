Blocitoff::Application.routes.draw do

  resources :lists do
    resources :items
  end

  devise_for :users

  resources :users, only: [:show, :index, :update]
  
  root to: 'welcome#index'

end
