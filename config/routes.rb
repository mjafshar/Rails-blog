Rails.application.routes.draw do

  get '/users/signup' => 'users#new', as: :signup
  resources :users, except: :new do
    resources :posts, except: [:show, :index] # automatic way to build RESTful routes
  end
  resources :posts, except: [:show, :index] do # automatic way to build RESTful routes
    resources :comments # adds comments as nested routes
  end

  resources :posts, only: [:show, :index]
  # get    '/posts'          => 'posts#index'     # index: display a list of all posts
  # get    '/posts/new'      => 'posts#new'       # new: return an HTML form for creating a new post
  # post   '/posts'          => 'posts#create'    # create: create a new post
  # get    '/posts/:id'      => 'posts#show'      # show: display a specific post
  # get    '/posts/:id/edit' => 'posts#edit'      # edit: return an HTML form for editing a post
  # put    '/posts/:id'      => 'posts#update'    # update: update a specific post
  # delete '/posts/:id'      => 'posts#destroy'   # destroy:
  # Users


  # Sessions
  get    '/login'  => 'sessions#new'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy', :via => :delete

  root :to => 'users#index'
end

# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Example resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Example resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Example resource route with more complex sub-resources:
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', on: :collection
#     end
#   end

# Example resource route with concerns:
#   concern :toggleable do
#     post 'toggle'
#   end
#   resources :posts, concerns: :toggleable
#   resources :photos, concerns: :toggleable

# Example resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end
