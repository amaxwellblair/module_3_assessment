Rails.application.routes.draw do
  root 'items#index'

  post "/search", to: "search#index", as: "searches"

  namespace :api, constraints: { format: 'json'} do
    namespace :v1 do
      get "/items", to: "items#index"
      post "/items", to: "items#create"
      get "/items/:id", to: "items#show"
      delete "/items/:id", to: "items#destroy"
    end
  end


  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
