Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  namespace :users do
    resources :articles, only: %i(new create edit update) do
      resources :comments, only: %i(create)
    end
  end

  resources :articles, only: %i(index show)

  root to: "articles#index"
end
