Rails.application.routes.draw do

  get 'welcome/index'

  root 'welcome#index'

  match "/recipes/:id/vote", to: "recipes#vote", as: "vote_recipe", via: [:get, :post]

  resources :categories do
    resources :recipes
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  get "/search", to: "recipes#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
