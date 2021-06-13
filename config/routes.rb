Rails.application.routes.draw do






  mount ActionCable.server => '/cable'



  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  authenticated :user do
    get 'new_navigator' , to: "navigators#create_user" , as: 'create_navigator'
    post 'new_navigator' , to: "navigators#create_user"
    resources :lists
  resources :offers
  resources :states_students
  resources :students
  resources :users, except: [:show]
  resources :profiles , except: [:new,:edit,:show,:index]
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
  resources :admin_controls do
    resources :lists
    resources :checklists do
      resources :checklist_items
    end
  end

    get '/create_items', to: 'lists#create_items'
    post '/create_items' ,to: 'lists#create_items' , as: "create_lists"

    get '/destroy_engineer'  , to: 'designations#destroy_engineer' ,as: 'destroy_engineer'
    post '/destroy_engineer'  , to: 'designations#destroy_engineer'

    get '/destroy_support'  , to: 'admin_controls#destroy_support' ,as: 'destroy_support'
    post '/destroy_support'  , to: 'admin_controls#destroy_support'

    get '/destroy_manager'  , to: 'admin_controls#destroy_manager' ,as: 'destroy_manager'
    post '/destroy_manager'  , to: 'admin_controls#destroy_manager'

  resources :titles
  resources :universities
  resources :register_books
  get "/register_offer" , to: 'register_books#index_offer'  ,as: 'register_books_offer'


  resources :states do
    collection { post :import }
  end

  resources :cities do
    collection { post :import }
  end



  end

  get ":url" => "application#redirect_user", :constraints => { :url => /.*/ }

end


