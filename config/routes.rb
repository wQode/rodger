Rails.application.routes.draw do
  root :to => 'pages#homepage'
  resources :users, :documents, :classifications, :revisions

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
#              Prefix Verb   URI Pattern                         Controller#Action
#                root GET    /                                   pages#homepage
#               users GET    /users(.:format)                    users#index
#                     POST   /users(.:format)                    users#create
#            new_user GET    /users/new(.:format)                users#new
#           edit_user GET    /users/:id/edit(.:format)           users#edit
#                user GET    /users/:id(.:format)                users#show
#                     PATCH  /users/:id(.:format)                users#update
#                     PUT    /users/:id(.:format)                users#update
#                     DELETE /users/:id(.:format)                users#destroy
#           documents GET    /documents(.:format)                documents#index
#                     POST   /documents(.:format)                documents#create
#        new_document GET    /documents/new(.:format)            documents#new
#       edit_document GET    /documents/:id/edit(.:format)       documents#edit
#            document GET    /documents/:id(.:format)            documents#show
#                     PATCH  /documents/:id(.:format)            documents#update
#                     PUT    /documents/:id(.:format)            documents#update
#                     DELETE /documents/:id(.:format)            documents#destroy
#     classifications GET    /classifications(.:format)          classifications#index
#                     POST   /classifications(.:format)          classifications#create
#  new_classification GET    /classifications/new(.:format)      classifications#new
# edit_classification GET    /classifications/:id/edit(.:format) classifications#edit
#      classification GET    /classifications/:id(.:format)      classifications#show
#                     PATCH  /classifications/:id(.:format)      classifications#update
#                     PUT    /classifications/:id(.:format)      classifications#update
#                     DELETE /classifications/:id(.:format)      classifications#destroy
#           revisions GET    /revisions(.:format)                revisions#index
#                     POST   /revisions(.:format)                revisions#create
#        new_revision GET    /revisions/new(.:format)            revisions#new
#       edit_revision GET    /revisions/:id/edit(.:format)       revisions#edit
#            revision GET    /revisions/:id(.:format)            revisions#show
#                     PATCH  /revisions/:id(.:format)            revisions#update
#                     PUT    /revisions/:id(.:format)            revisions#update
#                     DELETE /revisions/:id(.:format)            revisions#destroy
#               login GET    /login(.:format)                    session#new
#                     POST   /login(.:format)                    session#create
#                     DELETE /login(.:format)                    session#destroy