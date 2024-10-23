Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :dashboards, only: [:index, :destroy]
    resources :users, only: [:index, :show]
  end

  namespace :admin do
    resources :post_genres
  end

  namespace :admin do
    resources :users do
      get 'user_posts', on: :member
    end
  end

  namespace :admin do
    resources :users do
      member do
        delete 'delete_post', to: 'users#delete_post'
      end
    end

    delete 'comments/:id', to: 'users#delete_comment', as: "delete_comment"

     

  end


  scope module: :public do
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
    resources :posts do
      resources :comments, only: [:create]
    end

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
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
