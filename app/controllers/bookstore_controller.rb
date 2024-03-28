class BookstoreController < ApplicationController
    def index
    @bookstores=Bookstore.all
    end

    def new
        @bookstore=Bookstore.new
    end

    def create
        @bookstore = Bookstore.new(bookstore_params)
        if @bookstore.save
          redirect_to showbs_path
        else
          render :new
        end
      end
      
      private
      def bookstore_params
        params.require(:bookstore).permit(:name, :address, :phone, :email,:image)
      end
      
   end
