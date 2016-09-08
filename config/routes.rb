Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  get "about", to: "pages#about"
  root to: "articles#index"

  namespace :users do
    resources :articles, only: %i(new create edit update) do
      resources :comments, only: %i(create)
    end
  end

  get ":username", to: "users/articles#index", as: "username_articles"
  resources :articles, only: %i(index show)
  resource :feedback, only: %i(new create)
end
