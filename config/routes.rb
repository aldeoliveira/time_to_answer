Rails.application.routes.draw do
  namespace :profiles_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :profiles
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
