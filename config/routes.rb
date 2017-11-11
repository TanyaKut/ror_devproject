Rails.application.routes.draw do
 root to: 'pages#index'
   devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  resources :posts do 
  	resources :postcomments 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end