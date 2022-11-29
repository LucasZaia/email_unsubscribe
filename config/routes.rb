Rails.application.routes.draw do
  resources :email_lists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'blacklist', to: 'email_lists#create'
 
end
