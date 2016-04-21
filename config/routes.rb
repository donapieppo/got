Rails.application.routes.draw do
  resources :organizations do
    resources :admins
    resources :printers
    resources :toners
  end

  resources :admins

  resources :vendors
  resources :printer_models
  resources :toner_models 

  resources :printers
  resources :toners 

  root 'home#index'
end
