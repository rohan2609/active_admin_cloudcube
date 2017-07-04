Rails.application.routes.draw do
  resources :offline_payments
  root 'home#index'
  resources :payments
  devise_for :users
  resources :plans
  resources :home
  resources :customers do 
    member do
      get :confirm_to_pay
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
match '/payu_callback' => 'customers#payu_return', :via => [:get, :post], :as => 'payments_payu_return'
end
