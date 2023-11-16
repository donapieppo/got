Rails.application.routes.draw do
  mount DmUniboCommon::Engine => "/dm_unibo_common", :as => "dm_unibo_common"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  get "/choose_organization", to: "home#choose_organization"

  resources :helps

  namespace :api, defaults: { format: :json } do
    get "vendor/:id/toner_models", to: "toner_models#index"
  end

  scope ":__org__" do
    resources :organizations
    resources :permissions

    resources :vendors
    resources :printer_models do
      resources :printers
    end
    resources :toner_models do
      resources :toners
    end

    resources :printers
    resources :toners

    post "search", to: "home#search", as: "search"
    get "report", to: "home#report", as: "report"

    resources :subscriptions

    get "/", to: "home#index", as: "current_organization_root"
  end

  root "home#index"
end
