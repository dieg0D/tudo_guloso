Rails.application.routes.draw do
  
  ############### Pages ##################
  root to: 'pages#index'
  get 'about' ,to: 'pages#about'

  ############### Users ##################
  resources :users
  get 'sign_in' ,to: 'sessions#new'
  post 'sign_in' ,to:  'sessions#create'
  delete 'sign_out' ,to: 'sessions#destroy'

  ############### Dishes #################
  resources :dishes

  ############### Categories #############
  resources :categories

  ############### Recipes #############
  resources :recipes
end
