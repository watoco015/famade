Rails.application.routes.draw do
  devise_for :users
  root to: "arts#index"
  resources :arts do
    resources :comments, only: :create
    resource  :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end
