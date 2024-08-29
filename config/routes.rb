Rails.application.routes.draw do
  root to: 'homes#top'

  get 'home/about' => 'homes#about', as: 'about'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users
  resources :posts
  resources :comments
  resources :post_genres

  resources :users do
    member do
      get 'mypage'
    end
    collection do
      get 'unsubscribe'
      patch 'withdraw'
    end
  end

  resources :homes do
    collection do
      get 'map'
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
