Rails.application.routes.draw do
  

  

  devise_for :teachers
  namespace :backoffice do
    get 'home', to: 'home#index'
    resources :subjects, only: [:index, :new, :create]
    resources :classrooms, only: [:index, :new, :create]
    resources :questionnaires, only: [:index, :new, :create]
  
  end

  get 'site', to: 'site/home#index'


  devise_for :users
  
  root to: 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
