Rails.application.routes.draw do
 
  get '/', to: 'application#index', as: 'root'



  resources :pets
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, :only => [:index, :show, :update] 

  devise_scope :user do
    get '/signin', to: 'users/sessions#new'
    get '/signout', to: 'users/sessions#destroy'
    post '/interested', to: 'pets#interested'
    get '/users/admindelete/:id', to: 'users#destroy'
    get '/users/adminupdate/:id', to: 'users#edit'
    
  end
   
  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
