Blocitoff::Application.routes.draw do

  resources :lists do
    resources :items do
      member do
        patch :complete
      end
    end
  end

  devise_for :users

  resources :users, only: [:show, :index, :update]
  
  root to: 'welcome#index'

  namespace :api do
    resources :users
    resources :lists do
      resources :items
    end
  end

end
