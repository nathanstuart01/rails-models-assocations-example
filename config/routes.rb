Rails.application.routes.draw do
  root 'recipes#index'

  resources :ingredients
  resources :recipes
  resources :recipe_ingredients, only: [:new, :create, :destroy]
end
