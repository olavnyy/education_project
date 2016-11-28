Rails.application.routes.draw do
  get 'requests/create'

  post 'auth_user' => 'authentication#authenticate_user'
  devise_for :users
  resources :users, only: [:show,:index,:update,:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schools, defaults: { format: 'json' }
  resources :news, defaults: { format: 'json' }
  resources :groups, :levels, defaults: { format: 'json' }
  resources :teachers, defaults: { format: 'json' }
  resources :parents, defaults: { format: 'json' }
  resources :students, defaults: { format: 'json' }
  resources :admins, defaults: { format: 'json' }
  resources :daily_reports, defaults: { format: 'json' }
  resources :attendances, defaults: { format: 'json' }
  resources :my_days, defaults: { format: 'json' }
  resources :our_days, defaults: { format: 'json' }

  resources :requests, defaults: { format: 'json' }
# Routes for photoalbums
  resources :albums do
    resources :photos
  end

  get 'album/new', to: 'albums#new'
  get '/albums/:id/edit', to: 'albums#edit'

end
