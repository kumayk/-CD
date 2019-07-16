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
  get '/', to: 'items#index'

  resources :items, only: [:index, :show]
  get 'items/searches', to: 'items#search'

  resources :cart_details, only: [:show, :destroy, :create, :update]

  resources :order_details, only: [:update]

  resources :orders, only: [:show, :create]

  resources :admin_users, only: [:index, :show, :edit, :destroy, :update]

  resources :reviews, only: [:destroy]

  resources :admin_items, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :admin_orders, only: [:index, :show, :update, :destroy, :edit]


#others

  #admins
  get '/admin', to: 'admins#top'


end
