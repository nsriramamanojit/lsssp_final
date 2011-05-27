Lsssp::Application.routes.draw do

  resources :payments

  resources :examinations

#  resources :questionbanks

  resources :subjects

  resources :users do
     get 'upload', :on=>:collection
     get 'export', :on=>:collection
  end
  
  resources :user_sessions

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  
  resources :registrations
  resources :password_resets, :only => [ :new, :create, :edit, :update ]
#  get "subjects/index"
#  get "subjects/new"
#  match "admin/subjects" => "subjects#index", :as => :subject
#  match "admin/subjects/new" =>"subjects#new", :as => :new_subject

  
  root :to => "user_sessions#new"
    
  match ':controller(/:action(/:id(.:format)))'
end
