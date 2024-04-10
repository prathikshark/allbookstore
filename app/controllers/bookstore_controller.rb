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
          flash[:notice] = "Bookstore added successfully"
          redirect_to showbs_path
        else
          render :new
        end
      end
      def destroy
        @bookstore = Bookstore.find(params[:id])
        @bookstore.destroy
        flash[:alert] = "Bookstore deleted"
        redirect_to showbs_path
      end

def edit
  @bookstore=Bookstore.find(params[:id])
   
end

def update
  @bookstore=Bookstore.find(params[:id])
   if @bookstore.update(bookstore_params)
    flash[:notice] = "Bookstore updated "
    redirect_to showbs_path
   else
    flash[:alert] = "Could not update"
    render :edit
   end
end

      private
      def bookstore_params
        params.require(:bookstore).permit(:name, :address, :phone, :email,:image)
      end
      
   end
