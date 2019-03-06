Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ------------------------
  #      AUTHENTICATION      #
  # ------------------------


  resources :users do
    collection do
      post '/login', to: 'users#login'

      post '/register', to: 'users#register'

    end
  end

  #### PROFILE

  get '/profiles', to: 'profiles#index'

  get '/profiles/:id', to: 'profiles#show'

  post '/profiles', to: 'profiles#create'

  delete '/profiles/:id', to: 'profiles#delete'

  put '/profiles/:user_id', to: 'profiles#update'


  # ------------------------
  #      POSTS ROUTES      #
  # ------------------------

  # INDEX ROUTE
  get '/posts', to: 'posts#index'

  # SHOW ROUTE
  get '/posts/:id', to: 'posts#show'

  # CREATE ROUTE
  post '/posts', to: 'posts#create'

  # DELETE ROUTE
  delete '/posts/:id', to: 'posts#delete'

  # UPDATE ROUTE
  put '/posts/:id', to: 'posts#update'


end
