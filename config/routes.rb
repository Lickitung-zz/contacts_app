Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
   get '/contacts' => 'contacts#index'
   get '/contacts/:id' => 'contacts#show'
   post '/contacts/' => 'contacts#create'
   put '/contacts/:id' => 'contacts#update'
   delete '/contacts/:id' => 'contacts#destroy'
   get '/tests' => 'contacts#test'
   #
   # users
   #
   post '/users' => 'users#create'
   #
   # sessions
   #
   post '/sessions' => 'sessions#create'
  end
end
