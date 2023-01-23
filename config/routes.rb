Rails.application.routes.draw do
  devise_for :admins
   resources :articles do
    collection do
      get :update_article
      get :display
      get :published
     end
    end  
  get 'articles/show_article' 
  root 'articles#display'
end
