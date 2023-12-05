Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"
  get "up" => "rails/health#show", as: :rails_health_check

  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/tenanthistory", to: "pages#tenanthistory", as: "tenanthistory"
  get "houses/:house_id/ownerhistory", to: "pages#ownerhistory", as: "ownerhistory"

  resources :houses do
    resources :rooms, only: [:new, :create, :edit]
  end

  resources :rooms, except: [:create, :edit] do
    resources :tickets, only: [:new, :create]
  end

  resources :tickets do
      resources :messages, only: :create
  end

end
