Rails.application.routes.draw do
  root 'items#index'

  post "/search", to: "search#index", as: "searches"

  namespace :api, constraints: { format: 'json'} do
    namespace :v1 do
      get "/items", to: "items#index"
    end
  end


  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
