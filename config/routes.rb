Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  get 'admin', to:'admin#index'

  get 'show', to: 'book#index' #display all
  delete 'book/:id', to: 'book#destroy',as:'delete_book'
  get 'book_edit/:id', to: 'book#edit', as: 'edit_book' #form for edit
  put 'book_update/:id' ,to: 'book#update', as:'update_book'

  get 'showbs', to: 'bookstore#index'
  delete 'bookstore/:id', to: 'bookstore#destroy', as:'delete_bookstore'
  get 'bookstore_edit/:id', to: 'bookstore#edit',as: 'edit_bookstore'
  put 'bookstore_update/:id',to: 'bookstore#update',as: 'update_bookstore'
  
  get 'addBookStore', to:'bookstore#new' #display form to add
  post 'addBookStore' ,to:'bookstore#create' #to create
  get 'addBook' ,to: 'book#new'
  post 'addBook', to:'book#create'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
