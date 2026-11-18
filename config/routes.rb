Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

  # Un visiteur peut voir la liste de tous les restaurants.
  #get "/restaurants", to: "restaurants#index"
  # Un visiteur peut ajouter un nouveau restaurant et être redirigé vers la vue show de la page de ce nouveau restaurant.
  #get "restaurants/new", to: "restaurants#new"
  #post "restaurants", to: "restaurants#create"
  # Un visiteur peut voir les détails d’un restaurant, avec tous les avis associés au restaurant.
  #get "restaurants/:id", to: "restaurants#show"
  # Un visiteur peut ajouter un nouvel avis à un restaurant.
  #get "restaurants/:restaurant_id/reviews/new", to: "review#new"
  #post "restaurants/:restaurant_id/reviews", to: "review#create"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
