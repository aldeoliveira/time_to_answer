Rails.application.routes.draw do
  devise_for :profiles
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
