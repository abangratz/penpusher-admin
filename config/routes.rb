PenpusherAdmin::Application.routes.draw do
  resources :articles
  # Controller: Articles
  # GET /articles             -> "index"
  # GET /articles/:id         -> "show"
  # GET /articles/new         -> "new"
  # GET /articles/:id/edit    -> "edit"
  # POST /articles            -> "create"
  # PUT/PATCH /articles       -> "update"
  # DELETE /articles/:id      -> "destroy"

  root :to => 'welcome#index'
end
