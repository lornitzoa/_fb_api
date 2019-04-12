Rails.application.routes.draw do

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Heroku Welcome Page



  # ------------------------
  #      AUTHENTICATION      #
  # ------------------------

  # resources :users do
  #   # collection do

      post '/users/login', to: 'users#login'

      post '/users/register', to: 'users#register'

  #   end
  # end



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
