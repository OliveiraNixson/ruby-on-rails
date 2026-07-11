Rails.application.routes.draw do
  root 'pages#home'

  resources :salgados do 
    collection do 
        get :disponibility
        patch :update_disponibility
    end
  end 

  resources :bebidas 

  resources :sucos do 
    collection do 
      get :disponibility 
      patch :update_disponibility
    end 
  end 
end
