Rails.application.routes.draw do
  root 'cources#index'
  get 'cources/new', to: 'cources#new'
  get 'about', to: 'pages#about'
  resources :students, except: [:destroy]
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  post 'cource_enroll', to: 'student_cources#create'
end
