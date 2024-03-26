Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  get 'admin', to:'admin#index'
  get 'showbs', to: 'bookstore#index'
  get 'show', to: 'book#index'
  get 'addBookStore', to:'bookstore#new'
  post 'addBookStore' ,to:'bookstore#create'
  get 'addBook' ,to: 'book#new'
  post 'addBook', to:'book#create'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
