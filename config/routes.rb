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

#reviews_routes(ikunaga)
  post '/items/:id/reviews', to: 'reviews#create'
  put '/items/:id/reviews/:id', to: 'reviews#update'
  patch '/items/:id/reviews/:id', to: 'reviews#update'
  delete '/items/:id/reviews/:id', to: 'reviews#destroy'

#items_routes(ikunaga)
  get '/', to: 'items#index'
  get '/items/:id', to: 'items#show'

#users_routes(ikunaga)
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  put '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'


end
