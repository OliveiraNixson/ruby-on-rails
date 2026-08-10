Rails.application.routes.draw do
  
  get "up" => "rails/health#show", as: :rails_health_check

  root 'imports#index'

  resources :imports, only: [:index, :create]

  resources :users, only: [:index]
end
