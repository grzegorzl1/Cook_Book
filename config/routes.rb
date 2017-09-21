Rails.application.routes.draw do

  devise_for :users
  # devise_for :models
  get 'welcome/index'

  root to: 'welcome#index'

  match "/recipes/:id/vote", to: "recipes#vote", as: "vote_recipe", via: [:get, :post]

  resources :categories
  resources :recipes
  resources :ingredients
  resources :components

  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  # end

  # get "/login", to: "sessions#new"
  # post "/login", to: "sessions#new"
  # delete "/logout", to: "sessions#destroy"
  get "/search", to: "recipes#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
