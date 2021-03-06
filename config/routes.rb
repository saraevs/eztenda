Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listing_deals do
    resources :bids, only: [ :new, :create, :index, :edit, :update ]
  end

  resources :users, only: [:show]
end
