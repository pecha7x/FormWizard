FormWizard::Application.routes.draw do
  devise_for :users
  resources :bunch_types
  resources :polls
  resources :companies
  resources :admins
  resources :main
  root to: 'main#index'
end
