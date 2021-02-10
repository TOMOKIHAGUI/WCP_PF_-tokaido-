Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: :about

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get "confirm"
      patch "hide"
    end
    member do
      get :followings
      get :followers
    end
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end
