Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :notes
  resources :catalogs
  root "catalogs#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
