Rails.application.routes.draw do
  get 'posts/edit'

  get 'posts/new'

  get 'posts/_form'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
