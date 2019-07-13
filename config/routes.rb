Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
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
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  put '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'


#reviews_routes
  post '/items/:id/reviews', to: 'reviews#create'
  put '/items/:id/reviews/:id', to: 'reviews#update'
  patch '/items/:id/reviews/:id', to: 'reviews#update'
  delete '/items/:id/reviews/:id', to: 'reviews#destroy'

#items_routes
  get '/', to: 'items#index'
  get '/items/:id', to: 'items#show'

#cart_details_routes
  get '/cart/:id', to: 'cart_details#show'
  delete '/cart/:id', to: 'cart_details#destroy'
  post '/cart', to: 'cart_details#create'
  put '/cart/:id', to: 'cart_details#update'
  patch '/cart/:id', to: 'cart_details#update'

#order_details_routes
  put '/order_detail/:id', to: 'cart_details#update'
  patch '/order_detail/:id', to: 'cart_details#update'

#orders_routes
  get '/order/:id', to: 'orders#show'
  post '/order/:id', to: 'orders#create'

#admin_users_routes
  get '/admin/:id', to: 'admin_users#show'
  get '/admin/:id/edit', to: 'admin_users#edit'
  put '/admin/:id', to: 'admin_users#destroy'
  patch '/admin/:id', to: 'admin_users#destroy'
  delete '/admin/:id', to: 'admin_users#update'

#admin_reviews_routes
  delete 'admin/reviews/:id', to: 'admin_reviews#destroy'

#admin_items_routes
  get '/admin/items', to: 'admin_items#index'
  get '/admin/items/:id', to: 'admin_items#show'
  post '/admin/items/:id', to: 'admin_items#create'
  get '/admin/items/:id/edit', to: 'admin_items#edit'
  put '/admin/items/:id', to: 'admin_items#update'
  patch '/admin/items/:id', to: 'admin_items#update'
  delete '/admin/items/:id', to: 'admin_items#destroy'

#admin_orders_routes
  get '/admin/orders', to: 'admin_orders#index'
  get '/admin/orders/:id', to: 'admin_orders#show'
  put '/admin/orders/:id', to: 'admin_orders#update'
  patch '/admin/orders/:id', to: 'admin_orders#update'
  delete '/admin/orders/:id', to: 'admin_orders#destroy'
  get '/admin/orders/:id/edit', to: 'admin_orders#edit'

end
