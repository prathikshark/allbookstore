class CartController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]

 def index
      @cart_items= Cart.all
      @total = total_price

 end
 def add_to_cart 
  @bookstore_id=params[:bookstore_id]
   @user_id=current_user.id
   @book_id=params[:book_id]
   @book=Book.find_by(id:@book_id)

  
   if @book.quantity > 0 
   @cart_item=Cart.find_by(book_id:@book_id)
if @cart_item
    @cart_item.update(quantity:@cart_item.quantity+1)
    flash[:notice] = "Quantity updated in cart"
    @book.update(quantity: @book.quantity-1)

else
   @cart_item=Cart.create(user_id:@user_id ,book_id:@book_id, quantity:1)

    if @cart_item.save
        flash[:notice] = "Book added successfully"
        @book.update(quantity: @book.quantity-1)

    else
        flash[:alert] = "Failed to add book"
    end
end
else
    flash[:alert] = "Book not available"
end

redirect_to show_book_path(id: @bookstore_id)

end
def decrease
    @book_id = params[:book_id]
    @cart_item = Cart.find_by(book_id: @book_id)
    @book = Book.find_by(id: @book_id)
  
    if @cart_item
      if @cart_item.quantity > 1
        flash[:alert] = "Book removed"
        @cart_item.update(quantity: @cart_item.quantity - 1)
      else
        flash[:alert] = "Book removed"
        @cart_item.destroy
      end
    end
  
    if @book
      @book.update(quantity: @book.quantity + 1)
    end
  
    redirect_to cart_index_path
  end
  
  def increase
    @book_id = params[:book_id]
    @cart_item = Cart.find_by(book_id: @book_id)
    @book = Book.find_by(id: @book_id)
  
    if @book && @book.quantity > 0
      if @cart_item
        flash[:notice] = "Book added"
        @cart_item.update(quantity: @cart_item.quantity + 1)
      else
        current_user.cart_items.create(book_id: @book_id, quantity: 1)
      end
      @book.update(quantity: @book.quantity - 1)
    else
      flash[:alert] = "Book not available"
    end
  
    redirect_to cart_index_path
  end
  

private
def total_price
    @cart_items.sum { |cart_item| cart_item.book.price * cart_item.quantity }
end
end