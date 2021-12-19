Rails.application.routes.draw do
  get '/search' => 'search#search'
  devise_for :users
  root 'homes#top'
  get '/about' => 'homes#about'
  resources :users,only: [:show, :index, :edit, :update] do
    collection do
      get 'quit'
      patch 'out'
    end
  end
  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
