Rails.application.routes.draw do
  scope "(:locale)", locale: /en|cy/ do
    get "pages/new"
    # Devise for authentication
    devise_for :users, controllers: { registrations: 'users/registrations' }

    # Root path (Pick one)
    root 'journals#index' # or change to 'visa_applications#new' if needed

    # Visa Applications Routes (only necessary actions)
    resources :visa_documents, only: [:new, :create, :edit, :update, :destroy, :index]

    # Journals Routes
    resources :journals, only: [:create, :new, :destroy]

    get 'pages/new', to: 'pages#new'
    # Or, if you want it to be the home page
    # root 'pages#new'

    # Health check
    get "up" => "rails/health#show", as: :rails_health_check

    # PWA Routes
    get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

    # Set cookies
    post "/form-handler", to: "cookies#set_cookie"

  end
end