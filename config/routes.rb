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

#orders_routes
  get 'orders' => 'orders#new'              # 入力画面
  post 'orders/confirm' => 'orders#confirm'   # 確認画面
  post 'orders/commit' => 'orders#commit'     # 送信完了画面
  get 'orders/shipping_address' => 'orders#shipping_address_new'
  post 'orders/shipping_address' => 'orders#shipping_address_create'



#admin_items
  get '/admin_items/artist', to: 'admin_items#artistnew'
  post '/admin_items/artist', to: 'admin_items#artistcreate'
  get '/admin_items/label', to: 'admin_items#labelnew'
  post '/admin_items/label', to: 'admin_items#labelcreate'
  get '/admin_items/category', to: 'admin_items#categorynew'
  post '/admin_items/category', to: 'admin_items#categorycreate'
  post '/admin_items/new', to: 'admin_items#create'

  resources :items, only: [:index, :show, :create] do
    resources :reviews, only: [:create, :update, :destroy]
  end


  resources :cart_details, only: [:index, :destroy, :create, :update]

  resources :order_details, only: [:update]


  resources :orders, only: [:show, :create, :new, :confirm, :commit]

  resources :admin_users, only: [:index, :show, :edit, :destroy, :update]

  resources :admin_items, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :admin_orders, only: [:index, :show, :update, :destroy, :edit]




  #admins
  get '/admin', to: 'admins#top'




end
