Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/todo", to:"articles#gets_articles"
  resources :articles 
  # Defines the root path route ("/")
  # root "articles#index"

end
