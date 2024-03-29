Myrestaurant::Application.routes.draw do

  resources :contacts
  resources :uploads
  get "payment/index"
  get "likers/index"
  post "likers/save"
  scope "/owner" do
    resources :cuisine_types,:tables,:restaurant_features,:users
    resources :amenitis,:items,:cuisines,:banquet_halls,:menus
    resources :restaurants do
      collection do
        get "list"
        get "restaurant_profile"
      end
      resources :reviews,:tables
    end
    resources :customers do
      collection do
        get 'profile'
      end
    end

  end


  resources :restaurants do
    collection do
      get "list"
      get 'restaurant_profile'
    end
  end
  resources :items
  resources :book_tables


  resources :carts
  resources :customers do
    collection do
      get 'profile'
    end
  end
  devise_for :users, :controllers => {registrations: 'registrations',omniauth_callbacks: "omniauth_callbacks"}

  #get 'auth/:provider/callback', to: 'omniauth_callbacks#create'
  #devise_scope :users do
  #  authenticated :user do
  #    root 'admin_dashboard#index', as: :authenticated_root
  #  end
  #  unauthenticated do
  #    root 'home#index', as: :root
  #  end
  #end

  root 'home#index', as: :root
  TheRoleManagementPanel::Routes.mixin(self)
  resources :customer_dashboard
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
end
