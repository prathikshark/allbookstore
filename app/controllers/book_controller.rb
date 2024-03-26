class BookController < ApplicationController
    def index
        @books=Book.all
    end

    def new
        @book=Book.new()
    end
    
    def create
       @book=Book.create(book_params)
       if @book.save
        puts "===================="
        puts @book.image.attached?
        redirect_to admin_path 
       else
        render :new
    end
end
    private
    def book_params
     params.require(:book).permit(:name,:author,:quantity,:price,:description,:bookstore_id,:image)
    end
   end