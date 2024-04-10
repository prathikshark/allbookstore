class BookController < ApplicationController
    def index
      @books = Book.all
    end 
    
    def show
      @bookstore_id=params[:id]
      @bookstore = Bookstore.find(@bookstore_id)
      @books = @bookstore.books 
    end
    def new
      @book = Book.new
    end
  
    def create
      book_manager = Admin::BookManager.new(book_params)
      @book = book_manager.create
  
      if @book
        redirect_to allbooks_path
      else
        render :new
      end
    end
  
    def destroy
      book_manager = Admin::BookManager.new(nil)
      book_manager.delete_book(params[:id])
      redirect_to allbooks_path
    end
    def edit
        book_editor = Admin::BookManager.new(params)
        @book = book_editor.find_book
      end
    
      def update
        book_editor = Admin::BookManager.new(params)
        @book = book_editor.update_book
    
        if @book
          redirect_to allbooks_path
        else
          render :edit
        end
      end
    private
  
    def book_params
      params.require(:book).permit(:name, :author, :quantity, :price, :description, :bookstore_id, :image)
    end
  end
  