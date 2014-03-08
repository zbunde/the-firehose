Thefirehose::Application.routes.draw do
  root to: "static_pages#index"
  get   '/login', :to => 'sessions#new', :as => :login
  get '/auth/github/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', to: 'sessions#destroy'
end