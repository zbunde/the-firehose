Thefirehose::Application.routes.draw do
  get   '/login', :to => 'sessions#new', :as => :login
  get '/auth/github/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
end