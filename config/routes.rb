Rails.application.routes.draw do

  get 'sessions/create'
  get 'sessions/destroy'
  post '/rate' => 'rater#create', :as => 'rate'
  resources :conversations do
    resources :messages
  end
  resources :charges
  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    resources :reviews, except: [:show, :index]
  end
  resources :stores
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :dashboards
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'profil/index'
  root 'dashboards#index'
end
