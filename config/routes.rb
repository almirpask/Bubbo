Rails.application.routes.draw do
  

  

  

  devise_for :teachers, :controllers => { registrations: 'teacher_devise' }

  namespace :backoffice do
    get 'home', to: 'home#index'
    resources :subjects, except: [:show,:destroy]
    #get 'subjects/:id', to: 'questions#questionnaire'
    resources :classrooms, except: [:show,:destroy]
    resources :questionnaires, except: [:show,:destroy]
    resources :alternatives, only: [:create, :edit, :update]
    resources :questions, only: [:create]
    get 'questions/questionnaire/:id', to: 'questions#questionnaire'
    get 'alternatives/question/:id', to: 'alternatives#question'
    post 'auth/login', to: 'login#auth'
  end

  namespace :api do
    namespace :v1 do
      resources :answers, only: [:index,:create]
      resources :alternatives, only: [:create, :edit, :update]
      resources :questions, only: [:create]
      resources :questionnaires, except: [:destroy]
      get 'questions/questionnaire/:id', to: 'questions#questionnaire'
      get 'alternatives/question/:id', to: 'alternatives#question'
      resources :subjects, only: [:index]
    end
  end

  get 'site', to: 'site/home#index'


  devise_for :users
  
  root to: 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
