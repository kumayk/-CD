Rails.application.routes.draw do
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

#users_routes
  resources :users, only: [:show, :edit, :update]


#reviews_routes
  # post '/items/:id/reviews', to: 'reviews#create'
  # put '/items/:id/reviews/:id', to: 'reviews#update'
  # patch '/items/:id/reviews/:id', to: 'reviews#update'
  # delete '/items/:id/reviews/:id', to: 'reviews#destroy'
  resources :reviews, only: [:create, :update, :destroy]

#items_routes
  # get '/', to: 'items#index'
  # get '/items/:id', to: 'items#show'
  resources :items, only: [:index, :show]

#cart_details_routes
  # get '/cart/:id', to: 'cart_details#show'
  # delete '/cart/:id', to: 'cart_details#destroy'
  # post '/cart', to: 'cart_details#create'
  # put '/cart/:id', to: 'cart_details#update'
  # patch '/cart/:id', to: 'cart_details#update'
  resources :cart_details, only: [:show, :destroy, :create, :update]

#order_details_routes
  # put '/order_detail/:id', to: 'cart_details#update'
  # patch '/order_detail/:id', to: 'cart_details#update'
  resources :order_details, only: [:update]

# #orders_routes
  # get '/order/:id', to: 'orders#show'
  # post '/order/:id', to: 'orders#create'
  resources :orders, only: [:show, :create]


#admin_users_routes
  # get 'admin/users/index', to: 'admin_users#index'
  # get '/admin/:id', to: 'admin_users#show'
  # get '/admin/:id/edit', to: 'admin_users#edit'
  # put '/admin/:id', to: 'admin_users#destroy'
  # patch '/admin/:id', to: 'admin_users#destroy'
  # delete '/admin/:id', to: 'admin_users#update'
  resources :admin_users, only: [:index, :show, :edit, :destroy, :update]


#admin_reviews_routes
  # delete 'admin/reviews/:id', to: 'admin_reviews#destroy'
  resources :reviews, only: [:destroy]


#admin_items_routes
  # get '/admin/items', to: 'admin_items#index'
  # get '/admin/items/:id', to: 'admin_items#show'
  # get '/admin/items/new', to: 'admin_items#new'
  # post '/admin/items/:id', to: 'admin_items#create'
  # get '/admin/items/:id/edit', to: 'admin_items#edit'
  # put '/admin/items/:id', to: 'admin_items#update'
  # patch '/admin/items/:id', to: 'admin_items#update'
  # delete '/admin/items/:id', to: 'admin_items#destroy'
  resources :admin_items, only: [:index, :show, :new, :create, :edit, :update, :destroy]


#admin_orders_routes
  # get '/admin/orders', to: 'admin_orders#index'
  # get '/admin/orders/:id', to: 'admin_orders#show'
  # put '/admin/orders/:id', to: 'admin_orders#update'
  # patch '/admin/orders/:id', to: 'admin_orders#update'
  # delete '/admin/orders/:id', to: 'admin_orders#destroy'
  # get '/admin/orders/:id/edit', to: 'admin_orders#edit'
  resources :cart_details, only: [:index, :show, :update, :destroy, :edit]


  #admins
  get '/admin', to: 'admins#top'


end
