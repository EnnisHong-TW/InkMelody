Rails.application.routes.draw do
  resources :products do
    resources :comments, shallow: true, only:[:create, :destroy]
    # member do
    #   patch :like
    # end
  end

  # /api
  namespace :api do
    namespace :v1 do
      resources :products, only: [] do
        member do
          # /api/v1/products/id/like
          patch :like
        end
      end
    end
  end

  #resources :comments, only: [:show, :edit, :update, :destroy]

  resource :users, except: [:destory] do
    collection do
      get :sign_in
    end
  end

  resource :sessions, only: [:create, :destroy]
  resource :cart, only: [:show, :create, :destroy] do
    collection do
      get :checkout
    end
  end
  # get '/users/sign_in', to: 'users#sign_in'


  # get "/products/new", to: "products#new", as: :new_product
  # post "/products", to: "products#create"
  # get '/products', to: 'products#index'
  # get '/products/:id', to: 'products#show', as: :product
  # patch '/products/:id', to: 'products#update'
  # delete '/products/:id', to: 'products#destroy'
  # get '/products/:id/edit', to: 'products#edit', as: :edit_product

  get "/about_us", to: "pages#about", as: :about
  get "/privacy", to: "pages#privacy", as: :privacy
  root "products#index"
end
