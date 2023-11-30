Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/history", to: "pages#history", as: "history"

  resources :houses do
    resources :rooms, only: [:new, :create, :edit]
  end

  resources :rooms, except: [:create, :edit] do
    resources :tickets, only: [:new, :create]
  end

  resources :tickets
end
