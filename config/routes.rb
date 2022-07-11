Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
    member do
      get "like", to: "posts#like"
    end
  end

  namespace :admin do
    root "application#index"

    resources :posts, except: [:index, :show] do
      resources :comments, only: [:destroy]
    end
  end
end
