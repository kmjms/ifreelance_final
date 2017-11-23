Rails.application.routes.draw do

  get 'dashboard/index'


  resources :expenses,only: [:index,:show,:destroy,:edit,:update]
  resources :items
  resources :projects,only: [:index,:show,:destroy,:edit,:update]
  
  
  resources :supports,only: [:create,:show,:destroy]
  post 'projects/send_bill_by_email'
  post 'supports/create_client'
  
  resources :projects do
    resources :items,only: [:index,:show,:destroy,:edit,:update]
  end

  root 'home#index'

  resources :type_projects,only: [:index,:show,:destroy,:edit,:update]
  resources :states,only: [:index,:show,:destroy,:edit,:update]
  resources :clients,only: [:index,:destroy,:edit,:update,:create]

  get 'clients/client_view'


  post 'clients/details'


  devise_for :freelances
  devise_for :clients

  get '*path' => redirect('/')

  get 'freelances/sign_out', to: 'home#logout', as: :signout 
  get '/logout', to: 'home#logout' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
