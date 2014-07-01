Rails.application.routes.draw do
  root :to => 'pages#homepage'
  resources :users, :documents, :classifications, :revisions

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
#        Prefix Verb   URI Pattern                   Controller#Action
#          root GET    /                             pages#homepage
#         users GET    /users(.:format)              users#index
#               POST   /users(.:format)              users#create
#      new_user GET    /users/new(.:format)          users#new
#     edit_user GET    /users/:id/edit(.:format)     users#edit
#          user GET    /users/:id(.:format)          users#show
#               PATCH  /users/:id(.:format)          users#update
#               PUT    /users/:id(.:format)          users#update
#               DELETE /users/:id(.:format)          users#destroy
#     documents GET    /documents(.:format)          documents#index
#               POST   /documents(.:format)          documents#create
#  new_document GET    /documents/new(.:format)      documents#new
# edit_document GET    /documents/:id/edit(.:format) documents#edit
#      document GET    /documents/:id(.:format)      documents#show
#               PATCH  /documents/:id(.:format)      documents#update
#               PUT    /documents/:id(.:format)      documents#update
#               DELETE /documents/:id(.:format)      documents#destroy
#         login GET    /login(.:format)              session#new
#               POST   /login(.:format)              session#create
#               DELETE /login(.:format)              session#destroy
