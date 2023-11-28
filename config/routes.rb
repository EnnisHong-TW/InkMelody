Rails.application.routes.draw do
  resources :products 
  resource :users, except: [:destory] do
    collection do
      get :sign_in
    end
  end
  
  resource :sessions, only: [:create, :destroy]
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
