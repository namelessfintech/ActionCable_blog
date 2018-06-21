Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "articles#index"

  get "categories/:id", to: "categories#show", as: "category"

  post "friend", to: "friendships#friend", as: "friend"
  delete "unfriend", to: "friendships#unfriend", as: "unfriend"

  resources :users do
    resource :profile
  end

  resources :articles do
    resources :comments
  end

  mount ActionCable.server => '/cable'
end
