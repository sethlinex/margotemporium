Rails.application.routes.draw do

  namespace :admin do
    root "application#index"

    resources :posts, except: [:index, :show] do
      resources :comments, only: [:delete]
    end

    scope path: "posts/:post_id", as: :delete do
      resources :comments, only: [:delete]
      delete "comments/delete"
    end
  end

  devise_for :users
  root "posts#index"

  resources :posts, only: [:index, :show]

  scope path: "posts/:post_id", as: :post do
    resources :comments, only: [:create]
  end
end
