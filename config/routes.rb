Rails.application.routes.draw do
  devise_for :users
  root to: "arts#index"
  resources :arts 
end
