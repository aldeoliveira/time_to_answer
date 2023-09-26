Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#evaluate'
  end

  namespace :admins_backoffice do
    get 'welcome/index'   # Dashboard
    resources :admins     # Administradores
    resources :subjects   # Assuntos/Áreas
    resources :questions  # Perguntas
  end

  namespace :users_backoffice do
    get 'welcome/index'
    # get 'profile', to: 'profile#edit'
    resources :profile, only: [:edit]
  end
  
  devise_for :admins, skip: [:registration]
  devise_for :users

  root 'site/welcome#index'
end
