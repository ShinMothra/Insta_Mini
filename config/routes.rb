Rails.application.routes.draw do
  get "follows/create"
  get "follows/destroy"
  get "home/index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
  resource :user, only: [:show]
  resources :posts, only: [:new, :create, :show, :edit, :update] do
    resources :comments, only: [:create, :destroy]
  end
  
  get "my_posts", to: "posts#my_posts", as: :my_posts
  get "feed", to: "posts#feed"

  resources :users, only: [:show] do
    member do
      post "follow", to: "follows#create"
      delete "unfollow", to: "follows#destroy"
    end

    collection do
      get "feed", to: "posts#feed"
    end
  end

  resources :posts do
    resource :like, only: [:create, :destroy, :edit, :update]
  end

  resources :comments, only: [:edit, :update]

end
