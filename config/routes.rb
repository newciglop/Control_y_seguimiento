Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources  :profiles
  resources :engineers
  resources :areas
  resources :designations
  resources :modalities
  resources :companies
  resources :items
  resources :types
  resources :themes
  resources :concepts
  resources :responsible_functions
  resources :workers



  resources :states do
    collection { post :import }
  end

  resources :cities do
    collection { post :import }
  end


  root "modalities#index"
end


