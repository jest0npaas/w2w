Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#index"
  get "/search", to: "pages#search"
  get "/results", to: "pages#results"
  resources :movies, only: [ :show, :index ]

  # resources :users, only: [:show]

  resources :favorite_movies_by_users, path: "favorite", only: [ :index, :create, :destroy ]
  resources :soon_to_watch_movies_by_users, path: "soon_to_watch", only: [ :index, :create, :destroy ]
  resources :already_watched_movies_by_users, path: "already_watched", only: [ :index, :create ]

  match "*unmatched", to: "application#not_found", via: :all
end
