Rails.application.routes.draw do
  get 'appointments/index'
  get 'appointments/show'
  get 'appointments/new'
  get 'appointments/edit'
  get 'physicians/index'
  get 'physicians/show'
  get 'physicians/new'
  get 'physicians/edit'
  get 'patients/index'
  get 'patients/show'
  get 'patients/new'
  get 'patients/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "patients#index"
  resources :patients
  resources :physicians
  resources :appointments
end
