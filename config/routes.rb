Rails.application.routes.draw do
  

  

  devise_for :teachers, :controllers => { registrations: 'teacher_devise' }
  namespace :backoffice do
    get 'home', to: 'home#index'
    resources :subjects, except: [:show,:destroy]
    resources :classrooms, except: [:show,:destroy]
    resources :questionnaires, except: [:show,:destroy]
  
  end

  get 'site', to: 'site/home#index'


  devise_for :users
  
  root to: 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
