Rails.application.routes.draw do

  root 'items#index'

  #devise_for :admins
  #devise_for :users

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#resources

  resources :users, only: [:show, :edit, :update]
  resources :reviews, only: [:create, :update, :destroy]

#items_routes
  # post 'items', to: 'items#create'
  get '/', to: 'items#index'

  get 'items/search', to: 'items#search'
  post 'items/search'


#admin_items
  get '/admin_items/artist', to: 'admin_items#artistnew'
  post '/admin_items/artist', to: 'admin_items#artistcreate'
  get '/admin_items/label', to: 'admin_items#labelnew'
  post '/admin_items/label', to: 'admin_items#labelcreate'
  get '/admin_items/category', to: 'admin_items#categorynew'
  post '/admin_items/category', to: 'admin_items#categorycreate'

  resources :items, only: [:index, :show, :create] do
    resources :reviews, only: [:create, :update, :destroy]
  end


  resources :cart_details, only: [:show, :destroy, :create, :update]

  resources :order_details, only: [:update]

  resources :orders, only: [:show, :create, :new, :confirm]

  resources :admin_users, only: [:index, :show, :edit, :destroy, :update]

  resources :admin_items, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :admin_orders, only: [:index, :show, :update, :destroy, :edit]




  #admins
  get '/admin', to: 'admins#top'




end
