Rails.application.routes.draw do
 
  resources :articles 
  get 'articles/create_item' 
end
