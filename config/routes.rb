Rails.application.routes.draw do
  resources :expenses
  resources :items
  resources :projects
  resources :type_projects
  resources :states
  devise_for :freelances
  devise_for :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
