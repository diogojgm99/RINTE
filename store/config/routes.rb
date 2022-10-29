Rails.application.routes.draw do
  root "storage#index"
  
  get "/storage", to: "storage#index"
  resources :storage
  resources :country
  resources :city
  resources :color
  resources :materials
end
