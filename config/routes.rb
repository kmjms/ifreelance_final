Rails.application.routes.draw do

  get 'payment/response'

  get 'payment/confirmation'

  get 'dashboard/index'

  get 'home/index'

  resources :expenses
  resources :items
  resources :projects
  
  post 'projects/send_bill_by_email'
  #resources :projects do
   # get 'view_items/:id', to: 'projects#view_items'
  #end
  #resources :projects  do
    #collection do
    #  get 'view_items/:id', :to => "projects#view_items"
   # end
  #end

  #get 'item/view_by_project/:project_id'

  resources :projects do
    resources :items
  end

  root 'home#index'

  resources :type_projects
  resources :states
  resources :clients

  devise_for :freelances
  devise_for :clients

  get 'payment/response'
  post 'payment/confimation'
  get 'payment/report'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
