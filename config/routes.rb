Rails.application.routes.draw do

  get 'dashboard/index'

  get 'home/index'

  resources :expenses
   resources :items
  resources :projects
 
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


  resources :type_projects
  resources :states
  resources :clients

  devise_for :freelances
  devise_for :clients

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
