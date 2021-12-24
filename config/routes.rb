Rails.application.routes.draw do
  get '/search' => 'search#search'
  devise_for :users
  root 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only: %i[show index edit update] do
    collection do
      get 'quit'
      patch 'out'
    end
  end
  resources :posts, only: %i[index show create edit update destroy] do
    resources :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
