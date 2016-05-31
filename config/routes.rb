Rails.application.routes.draw do
  resources :organizations do
    resources :admins
    resources :printers
    resources :toners
  end

  resources :admins

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

  resources  :subscriptions

  root 'home#index'
end
