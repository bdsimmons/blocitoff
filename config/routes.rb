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

end
