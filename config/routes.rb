Rails.application.routes.draw do

  resources :traceabilities

  resources :events

  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#index', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  resources :cargos

  resources :reintegros

  resources :traspasos

  resources :cuentadantes

  resources :elementos

  resources :cuentadantes do
    resources :elementos
  end

  resources :elementos do
    resources :traspasos
  end

  resources :elementos do
    resources :reintegros
  end

  get 'pagina/saim'
  get 'pagina/bloqueo'
  get 'pagina/estadisticas'
  get 'pagina/elementosxcuentadantes'
  get 'pagina/etraspasos'
  get 'pagina/ereintegros'
  get 'pagina/traceability'

  resources :tipo_elems

  resources :tipo_docs


  
    get 'allelementos/', to: 'elementos#allelementos', as: 'objetos'

    get 'allreintegros/', to: 'reintegros#allreintegros', as: 'objetos1'
    
    get 'alltraspasos/', to: 'traspasos#alltraspasos', as: 'objetos2'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pagina#saim'

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
