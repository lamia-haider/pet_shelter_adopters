Rails.application.routes.draw do
 
  get '/', to: 'application#index', as: 'root'

  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy'
  end
   
  devise_for :users
  # , :controllers => { 
  #   omniauth_callbacks: "users/omniauth_callbacks",
  #   confirmations: 'users/confirmations',
  #   passwords: 'users/passwords',
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions' }
 
  resources :pets
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
