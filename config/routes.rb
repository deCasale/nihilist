Nihilist::Application.routes.draw do
  
  root :to => "comics#last"
  
  #comics
  resources :comics
  get "last" => "comics#last"
  get "first" => "comics#first"
  
  #administration interface
  namespace "admin" do
    get "logout" => "sessions#destroy", :as => :logout
    get "login" => "sessions#new", :as => :login
    post "login" => "sessions#create"
    root :to => "sessions#new"
    resources :users
    resources :comics
  end
  
end
