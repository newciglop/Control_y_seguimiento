Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources  :profiles
  resources :engineers
  resources :areas
  resources :designations
  resources :modalities
  resources :companies

  root "modalities#index"
end


