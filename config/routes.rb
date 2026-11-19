Rails.application.routes.draw do
  root 'drinks#index'
  resource :cart, only: [:show, :destroy] do
    put ':drink_id', action: :update, as: :update
    patch ':drink_id', action: :add, as: :add
    delete ':drink_id', action: :remove, as: :remove
  end
  resources :users, only: [:new, :create]
  resource :session
  resources :passwords, param: :token
  resources :drinks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
