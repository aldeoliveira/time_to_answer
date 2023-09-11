Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
  end

  namespace :admins_backoffice do
    get 'welcome/index'   # Dashboard
    resources :admins     # Administradores
    resources :subjects   # Assuntos/Áreas
    resources :questions  # Perguntas
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end
  
  devise_for :admins
  devise_for :users

  root 'site/welcome#index'
end
