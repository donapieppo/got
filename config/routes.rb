Rails.application.routes.draw do
  mount DmUniboCommon::Engine => "/dm_unibo_common"

  get '/choose_organization', to: "home#choose_organization"

  resources :helps
  resources :organizations

  scope ":__org__" do
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

    post 'search', to: 'home#search', as: 'search'
    get  'report', to: 'home#report', as: 'report'

    resources  :subscriptions

    get '/', to: 'home#index', as: 'current_organization_root'
  end
  root to: 'home#index'
end
