Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: :index do
      resources :addresses, only: :create
    end
  end
end
