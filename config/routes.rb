Rails.application.routes.draw do
  

  

  namespace :api do
    namespace :v1 do
      get 'alternatives/create'
    end
  end

  devise_for :teachers, :controllers => { registrations: 'teacher_devise' }
  namespace :backoffice do
    get 'home', to: 'home#index'
    resources :subjects, except: [:show,:destroy]
    resources :classrooms, except: [:show,:destroy]
    resources :questionnaires, except: [:show,:destroy]
    
  
  end

  namespace :api do
    namespace :v1 do
      resources :alternatives, only: [:create, :edit, :update]
      resources :questions, only: [:create]
      
      get 'questions/questionnaire/:id', to: 'questions#questionnaire'
      get 'alternatives/question/:id', to: 'alternatives#question'
      
    end
  end

  get 'site', to: 'site/home#index'


  devise_for :users
  
  root to: 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
