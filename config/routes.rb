Rails.application.routes.draw do

  resources :transfers

  #_____________________ruta para importaciones

  resources :cuentadantes do
    collection { post :import }
  end

  #____________________________________________



  resources :reintegros





  #________________________ruta anidada de cinco

  resources :cuentadantes

  resources :floors do
    resources :areas
  end

  resources :areas do
    resources :elementos
  end

  resources :elementos do
    collection { post :import }
  end

  resources :elementos do
    resources :transfers
  end

  resources :elementos do
    resources :reintegros
  end


  #_____________________________________________









  resources :events

  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#index', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  resources :cargos

  get 'elementos/elementcuenta', :as => :prueba
  get 'pagina/saim'
  get 'pagina/bloqueo'
  get 'pagina/estadisticas'
  get 'pagina/elementosxcuentadantes'
  get 'pagina/elementosxareas'
  get 'pagina/etraspasos'
  get 'pagina/ereintegros'
  get 'pagina/estreintegr'
  get 'pagina/traceability'
  get 'pagina/index'
  get 'pagina/contactenos'
  resources :tipo_elems

  resources :tipo_docs


  
    get 'allelementos/', to: 'elementos#allelementos', as: 'objetos'

    get 'allcuentadantes/', to: 'cuentadantes#allcuentadantes', as: 'objet'

    get 'allreintegros/', to: 'reintegros#allreintegros', as: 'objetos1'
    
    get 'alltransfers/', to: 'transfers#alltransfers', as: 'objetos2'
  

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
