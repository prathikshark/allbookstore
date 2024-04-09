Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  get 'admin', to:'admin#index'

  get 'allbooks',to: 'book#index'
  get 'show/:id', to: 'book#show', as: 'show_book'
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


  resources :cart
  post 'cart/add_to_cart/:book_id', to: 'cart#add_to_cart', as: 'add_to_cart'
  put 'cart/decrease/:book_id' ,to: 'cart#decrease',as: 'decrease_cart_item'
  put 'cart/increase/:book_id' ,to: 'cart#increase',as: 'increase_cart_item'

  resources :payment
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
