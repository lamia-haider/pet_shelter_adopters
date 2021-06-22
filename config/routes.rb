Rails.application.routes.draw do

  get '/', to: 'application#index', as: 'root'
 
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resource :pets

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
