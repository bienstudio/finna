get '/users/:id', to: 'users#show'
post '/users', to: 'users#create'
patch '/users/:id', to: 'users#update'
delete '/users/:id', to: 'users#destroy'
