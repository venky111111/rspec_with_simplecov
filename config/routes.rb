Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
 
  resources :users do
    get 'user_products', on: :member
    get 'user_reviews', on: :member
  end
    
  resources :products
  
  resources :reviews
 
end
