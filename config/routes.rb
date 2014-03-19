Thefirehose::Application.routes.draw do
  resources :links
  get "/links/tagged/:id", to: "links#index"
  get "/links/user/:id", to: "links#index"
  root to: "static_pages#index"
  get '/login', :to => 'sessions#new', :as => :login
  get '/auth/github/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', to: 'sessions#destroy'
end