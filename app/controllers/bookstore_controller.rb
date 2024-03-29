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
      
def destroy
  @bookstore=Bookstore.find_by(params[:id])
  @bookstore.destroy
  redirect_to showbs_path
end

def edit
  @bookstore=Bookstore.find(params[:id])
   
end

def update
  @bookstore=Bookstore.find(params[:id])
   if @bookstore.update(bookstore_params)
    redirect_to showbs_path
   else
    render :edit
   end
end

      private
      def bookstore_params
        params.require(:bookstore).permit(:name, :address, :phone, :email,:image)
      end
      
   end
