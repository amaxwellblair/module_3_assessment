Rails.application.routes.draw do
  root 'items#index'

  post "/search", to: "search#index", as: "searches"

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
