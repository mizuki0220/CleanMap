Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/destroy'
  get 'users/edit'
  get 'users/show'
  get 'users/update'
  root to: 'homes#top'

  get 'home/about' => 'homes#about', as: 'about'

  devise_for :users

  resources :users
  resources :posts
  resources :comments


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
