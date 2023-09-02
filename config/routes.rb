Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :site do
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins # Administradores
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end
  
  devise_for :admins
  devise_for :users

  root 'site/welcome#index'
end
