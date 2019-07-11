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


end
