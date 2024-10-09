Rails.application.routes.draw do
  root to: 'homes#top'

  get 'home/about' => 'homes#about', as: 'about'
  get "search" => "searches#search"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, except: [:show]
  resources :posts
  resources :comments
  resources :post_genres

  resources :users do
    member do
      get 'mypage'
      patch 'withdraw'
    end
    collection do
      get 'unsubscribe'
    end
  end

  resources :homes do
    collection do
      get 'map'
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
