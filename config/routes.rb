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
  resources :movies, only: [ :show ]

  resources :users, only: [:show]

  get 'favorite_movies', to: 'favorite_movies_by_users#index', as: 'favorite_movies'
  post 'favorite_movies/:movie_id', to: 'favorite_movies_by_users#create', as: 'add_favorite_movie'
  get 'soon_to_watch_movies', to: 'soon_to_watch_movies_by_users#index', as: 'soon_to_watch_movie'
  post 'soon_to_watch_movies/:movie_id', to: 'soon_to_watch_movies_by_users#create', as: 'add_soon_to_watch_movie'
  get 'already_watched_movies', to: 'already_watched_movies_by_users#index', as: 'already_watched_movie'
  post 'already_watched_movies/:movie_id', to: 'already_watched_movies_by_users#create', as: 'add_already_watched_movie'
end