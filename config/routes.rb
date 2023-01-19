Rails.application.routes.draw do
   resources :articles do
    collection do
      get :update_article
      get :display
     end
    end  
  get 'articles/show_article' 
  root 'articles#display'
end
