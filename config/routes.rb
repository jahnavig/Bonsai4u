Bonsai4u::Application.routes.draw do

  resources :line_items

  resources :carts

 # get "carts/index"

  get "bonsai_gallery/index"
  get "bonsai_gallery/checkout"
  get "bonsai_gallery/search"
  post "bonsai_gallery/search"
  post "bonsai_gallery/checkout"
  get "bonsai_gallery/purchase_complete"
  post "bonsai_gallery/purchase_complete"


  resources :stores

  get "admin/login"
  post "admin/login"
  get "admin/logout"
  get "account/index"
  get "account/signup"
  post "account/signup"
  post "account/login"
  get "account/login"
  get "account/contactus"
  post "account/forget_password"
  get "account/forget_password"
  get "account/reset_password"
  post "account/reset_password"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'bonsai_gallery#index'

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
end
