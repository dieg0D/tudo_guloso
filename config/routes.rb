Rails.application.routes.draw do
  
  root to: 'pages#index'
  get 'about' ,to: 'pages#about'

  ############Users##########
  resources :users
  get 'sign_in' ,to: 'sessions#new'
  post 'sign_in' ,to:  'sessions#create'
  delete 'sign_out' ,to: 'sessions#destroy'

end
