Rails.application.routes.draw do

  get 'dashboard/index'

  get 'home/index'

  resources :expenses,only: [:index,:show,:destroy,:edit,:update]
  resources :items
  resources :projects,only: [:index,:show,:destroy,:edit,:update]
  
  post 'projects/send_bill_by_email'
  
  resources :projects do
    resources :items,only: [:index,:show,:destroy,:edit,:update]
  end

  root 'home#index'

  resources :type_projects,only: [:index,:show,:destroy,:edit,:update]
  resources :states,only: [:index,:show,:destroy,:edit,:update]
  resources :clients,only: [:index,:show,:destroy,:edit,:update]

  devise_for :freelances,only: [:index,:destroy,:edit,:update]
  devise_for :clients,only: [:index,:destroy,:show,:edit,:update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
