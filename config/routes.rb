Rails.application.routes.draw do
  get 'share/index'
  get 'books/index'
  get 'home/index'
  root to:'home#dashboard'
  devise_for :users


  resources :books do
    resources :shares
  end 
  resources :users do 
    resources :books 
  end
  
end
