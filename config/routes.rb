Rails.application.routes.draw do
 
  get '/', to: 'application#index', as: 'root'

  devise_scope :user do
    get '/signin', to: 'devise/sessions#new'
    get '/signout', to: 'devise/sessions#destroy'
    post '/interested', to: 'pets#interested'
  end
   
  devise_for :users, :controllers => { 
    omniauth_callbacks: "users/omniauth_callbacks"
      }
 
  resources :pets
  resources :users, :only => [:index] 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
