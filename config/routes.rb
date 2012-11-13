Porka::Application.routes.draw do
  resources :administradores
  resources :usuarios
  resources :cooperativas
  resources :clientes
  resources :destaques
  resources :telefones
  resources :enderecos
  resources :main
  resources :cotacaos
  resources :ofertas

  root :to => 'Main#index'

  match 'usuarios/:id/novo-telefone' => 'Telefones#newUsuario', :as => 'new_telefone_usuario'
  match 'usuarios/:id/novo-endereco' => 'Enderecos#newUsuario', :as => 'new_endereco_usuario'

  match 'cooperativas/seleciona-categoria' => 'Cooperativas#seleciona_categoria'
  match 'cooperativas/seleciona-subcategoria' => 'Cooperativas#index'

  match 'admin/usuarios/:id/novo-telefone' => 'Telefones#newUsuario', :as => 'new_admin_telefone_usuario'
  match 'admin/usuarios/:id/novo-endereco' => 'Enderecos#newUsuario', :as => 'new_admin_endereco_usuario'

  match 'admin/ofertas/aprovar/:id' => 'Admin::Ofertas#aprovar', :as => 'new_admin_aprovacao_cotacao'

  match 'admin/home' => 'Admin::Logins#create'

  match 'admin/oferta/:id/tornar-destaque' => 'Admin::Destaques#create', :as => 'create_admin_destaque'

  namespace :admin do
      resources :administradores
      resources :cooperativas
      resources :cotacaos
      resources :clientes
      resources :destaques
      resources :imagens
      resources :telefones
      resources :ofertas
      resources :categorias
      resources :subcategorias
      resources :produtos
      resources :usuarios

      root :to => 'Logins#index'
   end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
