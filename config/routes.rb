Rails.application.routes.draw do

  root "pages#home"

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                              :registrations => 'registrations'}

  resources :services

  resources :services do
  	resources :orders, only: [:create]
  end

  resources :orders, only: [:show, :destroy]

  get '/user_orders' => 'orders#user_orders'
  get '/user_sales' => 'orders#user_sales'
  get '/my_services' => 'services#my_services'
  
end