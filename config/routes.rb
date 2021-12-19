Rails.application.routes.draw do
  devise_for :users
  get 'comments/create'
  get 'comments/desrtroy'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'posts/index'
  get 'posts/show'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  get 'homes/top'
  get 'homes/about'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/quit'
  get 'users/out'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
