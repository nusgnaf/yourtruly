Rails.application.routes.draw do
  root 'intro#index'
  resources :students
  get 'intro/index'
  get 'intro/backdoor'
  post 'intro/check'
  post 'intro/upload'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
