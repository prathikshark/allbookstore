require "/Users/prkoteshwara/hello/allbookstore/lib/services/bookstore_service.rb"

class BookstoreController < ApplicationController
   before_action :init_bookstore,only: [:new] 
   def index
      @bookstores = Bookstore.all
   end

   def new
   end

 def create
      service=BookstoreLogic::Bookstore_Service.new(params: bookstore_params)
      result = service.create_bookstore
      # byebug
      if result.errors
         flash.now[:alert] = result.errors.join(', ')
         render :new
       else
         redirect_to showbs_path
         flash[:notice] = "Bookstore added successfully"
       end
 end

 
 def destroy
      result = BookstoreLogic::Bookstore_Service.new(id: params[:id]).delete_bookstore
      if result.errors
         redirect_to showbs_path
         flash[:alert] = "Successfully deleted"
      else 
         redirect_to showbs_path
         # flash[:alert] = result.errors.join(', ')
      end
 end

 def edit
    @bookstore = Bookstore.find(params[:id])
 end

 def update
    @bookstore = Bookstore.find(params[:id])
    service = BookstoreLogic::Bookstore_Service.new(params: bookstore_params)
    result = service.update_bookstore(@bookstore)

    if result[:success]
      flash[:notice] = result[:message]
      redirect_to showbs_path
    else
      flash[:alert] = result[:message]
      render :edit
    end
 end

 private

 def bookstore_params
    params.require(:bookstore).permit(:name, :address, :phone, :email, :image)
 end

 def init_bookstore
   @bookstore = Bookstore.new()
 end

end

