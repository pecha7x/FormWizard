FormWizard::Application.routes.draw do
  resources :bunch_types
  resources :polls
  root to: 'bunch_types#edit', id: 1
end
