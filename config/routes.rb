Rails.application.routes.draw do
  get 'welcome/landing'
  root 'welcome#landing'
  # resources :students
  get 'intro/index'
  get 'intro/backdoor'
  post 'intro/check'
  post 'intro/upload'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
